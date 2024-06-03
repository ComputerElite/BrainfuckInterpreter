using System.Data;
using System.Text.RegularExpressions;

namespace CEBrainfuckCreator
{
	public class Program
	{

		public static string bf = "";
		public static string bfReal = "";
		public static int codeDepth = 0;
		public static BrainfuckAddress currentMemoryAddress = new BrainfuckAddress();
		public static int currentLine = 0;
		public const int reservedMemoryLength = 16;
		public static Dictionary<string, BrainfuckAddress> variables = new Dictionary<string, BrainfuckAddress>();

		// compiler options
		public static bool stripComments;
		public static bool commentCode;
		public static bool minify;
		public static bool oMovement;
		public static bool seperateStateMachine;
		public const string allowedChars = "<>+\\-\\[\\].,#";
		public static Dictionary<string, int> labels = new Dictionary<string, int>();
		public static Dictionary<string, BrainfuckMacro> macros = new Dictionary<string, BrainfuckMacro>();

		public static void Main(string[] args)
		{
			try
			{
				Generate();
			}
			catch (Exception e)
			{
				Console.WriteLine("Error during compilation, check above for more info " + e.ToString());
			}
		}

		public static void Error(int line, string error) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine(line + ": " + lines[line] + "\n        " + error);
			throw new Exception();
		}
		public static List<string> lines = new List<string>();

		private static void AddPredefinedVariables() {
			for(int i = 0; i < reservedMemoryLength; i++) {
				AssignVariable("cebf_compiler_" + i, GetBFCompilerMemoryAddress(i));
			}
		}

		private static void AssignVariable(string name, BrainfuckAddress address) {
			if (variables.ContainsKey(name)) variables.Add(name, address);
			variables[name] = address;
			if (commentCode) bf += ";; Assigned memory address " + address + " the name '" + name + "'\n";
		}

		private static void FindLabels() {
			int instructionCounter = 0;
			for(currentLine = 0; currentLine < lines.Count; currentLine++)
			{
				instructionCounter++;
				if(lines[currentLine].StartsWith(":")) {
					Console.WriteLine("Found label " + lines[currentLine]);
					string label = lines[currentLine].Substring(1);
					labels.Add(label, instructionCounter);
				}
			}
		}

		public static void Generate(string file = "test.cebf")
		{
			lines = File.ReadAllLines(file).ToList();
			
			
			HandleIncludes();
			TrimLines();
			AddPredefinedVariables();

			int instructionCounter = 1;


			// Reserved memory addresses
			// 0: math a
			// 1: math b
			// 2: math result
			// 3: logic gates tmp (NAND)
			// 4: logic gates tmp (XOR)
			// 5: logic gates tmp (XOR)
			// 6: logic gates tmp (XOR)
			// 7: Standard library reserved
			// 8: Standard library reserved
			// 9: copy tmp
			// 10: instruction pointer
			// 11: instruction pointer copy
			// 12: instruction pointer check
			// 13: pointer reserved (must always be 0)
			// 14:
			// 15: pointer

			BrainfuckAddress instructionPointerAddress = GetBFCompilerMemoryAddress(10);
			bfReal = "timeout:1000\n";
			// reserve first 10 memory addresses for variables of the compiler
			bfReal += new string('>', reservedMemoryLength) + "  ;;; Reserve bf compiler memory space";
			
			bfReal += bf;
			bf = "";
			GoToMemoryAddressNew(instructionPointerAddress);
			bfReal += "+["; // Start state machine
			AfterGoToMemoryAddress(instructionPointerAddress);

			// pre compile code prepare
			stripComments = lines.Any(x => x.ToLower().StartsWith("#nocomment"));
			commentCode = lines.Any(x => x.ToLower().StartsWith("#commentcode"));
			seperateStateMachine = lines.Any(x => x.ToLower().StartsWith("#seperatestatemachine"));
			HandleComments();


			// parse macros
			bool inFunction = false;
			string currentFunctionName = "";
			string currentFunction = "";
			int argumentCount = 0;
			for(currentLine = 0; currentLine < lines.Count; currentLine++) {
				if(lines[currentLine].StartsWith("macroend")) {
					inFunction = false;
					macros.Add(currentFunctionName, new BrainfuckMacro {
						name = currentFunctionName,
						argumentCount = argumentCount,
						content = currentFunction
					});
					lines[currentLine] = ";;" + lines[currentLine];
				}
				if(inFunction) {
					currentFunction += lines[currentLine] + "\n";
					lines[currentLine] = ";;" + lines[currentLine];
				}
				List<string> cmds = lines[currentLine].Split(' ').ToList();
				if(cmds[0] == "macro") {
					inFunction = true;
					currentFunction = "";
					currentFunctionName = cmds[1];
					try {
						argumentCount = ConvertToInt(cmds[2]);
					} catch(Exception e) {
						Error(currentLine, "argument count is not a valid number");
					}
					lines[currentLine] = ";;" + lines[currentLine];
				}
			}

			// Expand all macros
			ExpandAllMacros();



			FindLabels(); // MUST occur right before here
			for (currentLine = 0; currentLine < lines.Count; currentLine++)
			{
				if (lines[currentLine] == "") lines[currentLine] = ";; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩";
				List<string> cmds = lines[currentLine].Split(' ').ToList();
				string cmd = cmds[0];
				bfReal += "\n;;" + SanitizeComment(lines[currentLine]) + "\n";	
				BrainfuckAddress addressA;
				BrainfuckAddress addressB;
				BrainfuckAddress addressC;
				int value;
				int nextInstruction = instructionCounter + 1;
				if(currentLine == lines.Count - 1) {
					nextInstruction = 0;
				}

				switch (cmd)
				{
					case "jmp":
						nextInstruction = GetInstruction(cmds[1]);
						break;
					case "jmp.nz":
						IF(GetAddress(cmds[1]), new string('+', GetInstructionDiff(instructionCounter, GetInstruction(cmds[2]))), new string('+', GetInstructionDiff(instructionCounter, nextInstruction)));
						nextInstruction = instructionCounter;
						break;
					case "jmp.ez":
						IF(GetAddress(cmds[1]), new string('+', GetInstructionDiff(instructionCounter, nextInstruction)), new string('+', GetInstructionDiff(instructionCounter, GetInstruction(cmds[2]))));
						nextInstruction = instructionCounter;
						break;
					case "sad":
						int programAddress = ConvertToInt(cmds[1]);
						addressA = new BrainfuckAddress(ProgramAddressToCompiledAddress(programAddress), programAddress);
						string name = cmds[2];
						AssignVariable(name, addressA);
						break;
					case "dbg":
						bf += "#";
						break;
					case "set.c":
						addressA = GetAddress(cmds[1]);
						value = HandleReservedValue(cmds[2][0]);
						SetAddressValue(addressA, value);
						break;
					case "set.s":
						addressA = GetAddress(cmds[1]);
						foreach (char c in cmds[2])
						{
							SetAddressValue(addressA, HandleReservedValue(c));
							addressA.IncrementProgram();
							Console.WriteLine(addressA.ToString());
						}
						SetAddressValue(addressA, 0);
						break;
					case "set.n":
						addressA = GetAddress(cmds[1]);
						value = ConvertToInt(cmds[2]);
						SetAddressValue(addressA, value);
						break;
					case "inc":
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddressNew(addressA);
						bf += "++";
						AfterGoToMemoryAddress(addressA);
						break;
					case "set.a":
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						SetAddressValue(addressA, addressB.programAddress);
						break;
					case "cpy":
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						Copy(addressA, addressB);
						break;
					case "mpl":
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						MultiplyAddresses(addressA, addressB, addressC);
						break;
					case "add":
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						AddAddresses(addressA, addressB, addressC);
						break;
					case "sub":
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						SubstractAddresses(addressA, addressB, addressC);
						break;
					case "out.r":
						// output value at address
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddressNew(addressA);
						bf += ".";
						AfterGoToMemoryAddress(addressA);
						break;
					case "in.c":
						// input value at address
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddressNew(addressA);
						bf += ",";
						AfterGoToMemoryAddress(addressA);
						break;
					case "out.l":
						// output value starting at address for length
						addressA = GetAddress(cmds[1]);
						value = ConvertToInt(cmds[2]);
						if(addressA.isPointer) throw new Exception("Output length does not support pointers yet");
						for (int i = 0; i < value; i++)
						{
							GoToMemoryAddressNew(addressA);
							bf += ".";
							AfterGoToMemoryAddress(addressA);
							addressA++;
						}
						break;
					case "out.n":
						// output value starting at address till null
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddressNew(addressA);
						bf += "[.>]";
						AfterGoToMemoryAddress(addressA);
						break;
					case "wrt.s":
						// writes a string to the output
						cmds.RemoveAt(0);
						string s = String.Join(" ", cmds);
						OutputString(s);
						break;
					case "out.b":
						// output 'true' if the address is > 0 otherwise 'false'
						addressA = GetAddress(cmds[1]);
						IF(addressA, GetOutputStringCode("true\n"), GetOutputStringCode("false\n"));
						break;

					case "and":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						ANDGate(addressA, addressB, addressC);
						break;
					case "nand":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						NANDGate(addressA, addressB, addressC);
						break;
					case "or":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						ORGate(addressA, addressB, addressC);
						break;
					case "xor":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						XORGate(addressA, addressB, addressC);
						break;
					case "not":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						NOTGate(addressA, addressB);
						break;
				}
				GoToMemoryAddressNew(instructionPointerAddress); // we can ignore going back as the instruction pointer itself isn't considered a pointer in my definition of a pointer as an memory address
				int instructionDiff = GetInstructionDiff(instructionCounter, nextInstruction);
				string instruction = bf;
				string instructionPointerIncrementer = new string('+', instructionDiff);
				
				bf = "";
				if(seperateStateMachine) instruction = "\n\t\t" + instruction + "\n";
				bfReal += "-" + "[->+>+<<]>>[-<<+>>]<" + ">+<[>[-]<[-]]>[[-]<<" + instruction + instructionPointerIncrementer + ">>]<<";
				instructionCounter++;
			}

			bfReal += "]"; // End state machine loop

			// Compiler options:
			minify = lines.Any(x => x.ToLower().StartsWith("#minify"));
			oMovement = !lines.Any(x => x.ToLower().StartsWith("#noomovement"));

			string finalBF = "";
			string[] bfLines = bfReal.Split('\n');
			for (int i = 0; i < bfLines.Length; i++)
			{
				string finalLine = bfLines[i] + "\n";
				finalBF += finalLine;
			}

			if(oMovement)
			{
				string oldBF = "";
				while (oldBF.Length != finalBF.Length)
				{
					oldBF = finalBF;
					finalBF = finalBF.Replace("<>", "").Replace("><", "");
				}
			}

			if (minify)
			{
				finalBF = Regex.Replace(finalBF, "[^" + allowedChars + "]", "");
			}

			Console.WriteLine("Finished bf: \n\n" + finalBF);
			//ClipboardService.SetText(finalBF);
			File.WriteAllText("compiled.bf", finalBF);
		}

		private static string SanitizeComment(string comment)
		{
			return Regex.Replace(comment, "[" + allowedChars + "]", "\ud83d\udca9");
		}

		private static void HandleComments()
		{			
			for (int i = 0; i < lines.Count; i++)
			{
				if (lines[i].StartsWith(";;"))
				{
					if (stripComments)
					{
						lines.RemoveAt(i);
						i--;
					}
					else
					{
						// sanitize comments
						lines[i] = SanitizeComment(lines[i]);
					}
				}
			}
		}

		private static void TrimLines()
		{
			// Prepare lines: trim
			for (int i = 0; i < lines.Count; i++)
			{
				lines[i] = lines[i].Trim();
				if(lines[i] == ""){
					lines.RemoveAt(i);
					i--;
				}
			}
		}

		private static List<string> ResolveFile(string name)
		{
			if(!File.Exists(name)) {
				Error(currentLine, "File not found: " + name);
			}
			return File.ReadAllLines(name).ToList();
		}

		private static void HandleIncludes()
		{
			bool includedSmth = true;
			while (includedSmth)
			{
				includedSmth = false;
				for (int i = 0; i < lines.Count; i++)
				{
					List<string> cmds = lines[i].Split(' ').ToList();
					if (cmds[0] == "#include")
					{
						cmds.RemoveAt(0);
						string includeFile = String.Join(' ', cmds);
						List<string> includeLines = ResolveFile(includeFile);
						lines.RemoveAt(i);
						lines.InsertRange(i, includeLines);
						includedSmth = true;
						Console.WriteLine(i);
					}
				}
			}
		}

		public static void ExpandAllMacros() {
			string expandedCode = "";
			for(int i = 0; i < lines.Count; i++) {
				List<string> cmds = lines[i].Split(' ').ToList();
				string macroName = cmds[0];
				cmds.RemoveAt(0);
				if(cmds.Count <= 0 || !macros.ContainsKey(macroName)) {
					expandedCode += lines[i] + "\n";
					continue;
				}
				expandedCode += (commentCode ? ";; entering macro " + macroName + "\n" : "") + macros[macroName].Expand(i, cmds) + "\n" + (commentCode ? ";; exiting macro " + macroName + "\n" : "");
			}
			lines = expandedCode.Split('\n').ToList();
		}

		public static int GetInstruction(string instruction) {
			if(labels.ContainsKey(instruction)) {
				return labels[instruction];
			}
			return ConvertToInt(instruction);
		}

		public static int GetInstructionDiff(int instructionCounter, int nextInstruction) {
			int instructionDiff = nextInstruction - instructionCounter;
			if(nextInstruction == 0) {
				instructionDiff = 0;
			} else if(instructionDiff < 0 && nextInstruction != 0) {
				instructionDiff = lines.Count - instructionCounter + nextInstruction;
			}
			if(commentCode) bfReal += ";; Instruction diff: " + instructionDiff + "    next: " + nextInstruction + "     counter: " + instructionCounter + "\n";
			return instructionDiff;
		}

		/////////////////////// Helper methods

		/// <summary>
		/// CAUTION!!! Make sure both your onTrue and onFalse brainfuck code end on the same memory address as they start
		/// </summary>
		public static void IF(BrainfuckAddress address, string onTrue, string onFalse)
		{
			codeDepth++;
			if(commentCode) AddCommentInNewLine("Doing if for " + address);
			BrainfuckAddress startAddress = currentMemoryAddress.Clone();
			BrainfuckAddress tmpValueAddress = GetBFCompilerMemoryAddress(0);
			BrainfuckAddress tmpTrueAddress = GetBFCompilerMemoryAddress(1);

			// store value
			Copy(address, tmpValueAddress);
			bf += "#";
			codeDepth--;
			return;
			SetAddressValue(tmpTrueAddress, 1);
			GoToMemoryAddressNew(tmpValueAddress); // compiler addresses don't need a back
			bf += "[[-]>[-]";
			currentMemoryAddress = tmpTrueAddress.Clone();
			GoToMemoryAddressNew(startAddress);
			bf += onTrue;
			AfterGoToMemoryAddress(startAddress);
			GoToMemoryAddressNew(tmpTrueAddress); // compiler addresses don't need a back
			bf += "<]>[[-]";
			GoToMemoryAddressNew(startAddress);
			bf += onFalse;
			AfterGoToMemoryAddress(startAddress);
			GoToMemoryAddressNew(tmpTrueAddress); // compiler addresses don't need a back
			bf += "]<";
			currentMemoryAddress = tmpValueAddress.Clone();
			codeDepth--;
		}

		public static void OutputString(string s)
		{
			GoToMemoryAddressNew(GetBFCompilerMemoryAddress(9)); // compiler addresses don't need a back
			foreach (char c in s)
			{
				bf += "[-]" + new string('+', c) + ".";
			}
			bf += "[-]";
		}

		public static string GetOutputStringCode(string s)
		{ 
			GoToMemoryAddressNew(GetBFCompilerMemoryAddress(9)); // compiler addresses don't need a back
			foreach (char c in s)
			{
				bf += "[-]" + new string('+', c) + ".";
			}
			bf += "[-]";
			return bf;
		}

		public static void NANDGate(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress addressC)
		{
			codeDepth++;
			StartMathOperation(addressA, addressB, addressC);
			if (commentCode) AddCommentInNewLine("Perform XOR operation on " + GetRealAddress(addressA) + " and " + GetRealAddress(addressB) + " and store result in " + GetRealAddress(addressC) + " (AND Gate with inverted result)");
			// And gate
			bf += "[->+<]++[->-<]>>[-]+<[>-<[-]]<";
			GoToMemoryAddressNew(GetBFCompilerMemoryAddress(2)); // compiler addresses don't need a back
			// not gate
			bf += ">[-]+<[>-<[-]]";
			MoveValue(GetBFCompilerMemoryAddress(3), GetBFCompilerMemoryAddress(2));

			EndMathOperation(addressA, addressB, addressC);
			codeDepth--;
		}
		

		public static void NOTGate(BrainfuckAddress addressA, BrainfuckAddress addressB)
		{
			codeDepth++;
			StartMathOperation(addressA, addressB);
			if (commentCode) AddCommentInNewLine("Perform NOT operation on " + GetRealAddress(addressA) + " and store result in " + GetRealAddress(addressB));
			bf += ">[-]+<[>-<[-]]";
			EndMathOperation(addressA, addressB);
			codeDepth--;
		}

		public static void ANDGate(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress addressC)
		{
			codeDepth++;
			StartMathOperation(addressA, addressB, addressC);
			if (commentCode) AddCommentInNewLine("Perform AND operation on " + GetRealAddress(addressA) + " and " + GetRealAddress(addressB) + " and store result in " + GetRealAddress(addressC));
			bf += "[->+<]++[->-<]>>[-]+<[>-<[-]]<";
			EndMathOperation(addressA, addressB, addressC);
			codeDepth--;
		}

		public static void XORGate(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress addressC)
		{
			codeDepth++;
			// memory space compiler:
			// 0: reserved for nand gate
			// 1: reserved for nand gate
			// 2: reserved for nand gate
			// 3: reserved for nand gate
			// 4: AB
			// 5: AAB
			// 6: BAB

			// allocate required addresses
			BrainfuckAddress tmpAB = GetBFCompilerMemoryAddress(4);
			BrainfuckAddress tmpAAB = GetBFCompilerMemoryAddress(5);
			BrainfuckAddress tmpBAB = GetBFCompilerMemoryAddress(6);

			// perform operation
			NANDGate(addressA, addressB, tmpAB);
			NANDGate(addressA, tmpAB, tmpAAB);
			NANDGate(addressB, tmpAB, tmpBAB);
			NANDGate(tmpAAB, tmpBAB, addressC);
			// reset used cells
			ResetAddressValue(tmpAB);
			ResetAddressValue(tmpAAB);
			ResetAddressValue(tmpBAB);
			ResetAddressValue(GetBFCompilerMemoryAddress(0));
			ResetAddressValue(GetBFCompilerMemoryAddress(1));
			ResetAddressValue(GetBFCompilerMemoryAddress(2));
			codeDepth--;

		}

		public static int GetRealAddress(BrainfuckAddress address)
		{
			int tmpAddress = address.address + reservedMemoryLength;
			return tmpAddress;
		}

		public static void ORGate(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress addressC)
		{
			codeDepth++;
			StartMathOperation(addressA, addressB, addressC);
			if (commentCode) AddCommentInNewLine("Perform OR operation on " + GetRealAddress(addressA) + " and " + GetRealAddress(addressB) + " and store result in " + GetRealAddress(addressC));
			bf += "[->+<]>>[-]<[>+<[-]]<";
			EndMathOperation(addressA, addressB, addressC);
			codeDepth--;
		}

		public static void StartMathOperation(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress addressC)
		{
			BrainfuckAddress tmpAAddress = GetBFCompilerMemoryAddress(0);
			BrainfuckAddress tmpBAddress = GetBFCompilerMemoryAddress(1);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
			ResetAddressValue(addressC);
			Copy(addressA, tmpAAddress);
			Copy(addressB, tmpBAddress);
			GoToMemoryAddressNew(tmpAAddress); // compiler addresses don't need a back
		}

		public static void StartMathOperation(BrainfuckAddress addressA, BrainfuckAddress addressB)
		{
			BrainfuckAddress tmpAAddress = GetBFCompilerMemoryAddress(0);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(addressB);
			Copy(addressA, tmpAAddress);
			GoToMemoryAddressNew(tmpAAddress); // compiler addresses don't need a back
		}

		public static void EndMathOperation(BrainfuckAddress addressA, BrainfuckAddress addressB)
		{
			BrainfuckAddress tmpAAddress = GetBFCompilerMemoryAddress(0);
			BrainfuckAddress tmpBAddress = GetBFCompilerMemoryAddress(1);
			Copy(tmpBAddress, addressB);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
		}

		public static void EndMathOperation(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress addressC)
		{
			BrainfuckAddress tmpAAddress = GetBFCompilerMemoryAddress(0);
			BrainfuckAddress tmpBAddress = GetBFCompilerMemoryAddress(1);
			BrainfuckAddress tmpCAddress = GetBFCompilerMemoryAddress(2);
			Copy(tmpCAddress, addressC);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
			ResetAddressValue(tmpCAddress);
		}

		public static int HandleReservedValue(int value)
		{
			if (value == '^') return ' ';
			return value;
		}

		public static int ConvertToInt(string number)
		{
			return Convert.ToInt32(number);
		}

		public static BrainfuckAddress GetAddress(string address)
		{
			BrainfuckAddress a = new BrainfuckAddress();
			if(address.StartsWith("*")){
				a.isPointer = true;
				address = address.Substring(1);
			}
			if (address.StartsWith("$"))
			{
				string varName = address.Substring(1);
				if (variables.ContainsKey(varName))
				{
					a.address = variables[varName].address;
					a.programAddress = variables[varName].programAddress;
					return a;
				} else {
					Error(currentLine, "Variable '" + varName + "' does not exist");
				}
				return a;
			}
			a.address = ProgramAddressToCompiledAddress(ConvertToInt(address));
			return a;
		}

		public static int ProgramAddressToCompiledAddress(int address) {
			return address * 2;
		}

		public static void SetAddressValue(BrainfuckAddress address, int value)
		{
			GoToMemoryAddressNew(address);
			SetCurrentAddressValue(value);
			AfterGoToMemoryAddress(address);
		}

		public static void ResetAddressValue(BrainfuckAddress address)
		{
			codeDepth++;
			GoToMemoryAddressNew(address);
			if (commentCode) AddCommentInNewLine("Set address value to 0");
			bf += "[-]";
			AfterGoToMemoryAddress(address);
			codeDepth--;
		}

		public static void SetCurrentAddressValue(int value)
		{
			codeDepth++;
			// set value;
			if (commentCode) AddCommentInNewLine("Set address value to " + value);
			bf += "[-]" + new string('+', value);
			codeDepth--;
		}
		public static string GetAddressMoveNonPointer(BrainfuckAddress diff)
		{
			// set value;
			char sign = diff.address > 0 ? '<' : '>';
			return new string(sign, Math.Abs(diff.address));
		}

		public static void Copy(BrainfuckAddress addressA, BrainfuckAddress addressB)
		{
			codeDepth++;
			if(commentCode) AddCommentInNewLine("Copying from " + addressA + " to " + addressB);
			BrainfuckAddress tmpAddress = GetBFCompilerMemoryAddress(9);
			MoveValue(addressA, tmpAddress);
			GoToMemoryAddressNew(tmpAddress); // compiler addresses don't need a back
			if (commentCode) AddCommentInNewLine("Multi-move value from address " + tmpAddress + " into " + addressA + " and " + addressB);
			bf += "[-";
			GoToMemoryAddressNew(addressA);
			bf += "+";
			AfterGoToMemoryAddress(addressA);
			GoToMemoryAddressNew(addressB);
			bf += "+";
			AfterGoToMemoryAddress(addressB);
			GoToMemoryAddressNew(tmpAddress); // compiler addresses don't need a back
			bf += "]";
			codeDepth--;
		}

		public static void MoveValue(BrainfuckAddress addressA, BrainfuckAddress addressB)
		{
			codeDepth++;
			ResetAddressValue(addressB);
			GoToMemoryAddressNew(addressA);
			if (commentCode) AddCommentInNewLine("Move value from address " + addressA + " into " + addressB);
			bf += "[-";
			AfterGoToMemoryAddress(addressA);
			GoToMemoryAddressNew(addressB);
			bf += "+";
			AfterGoToMemoryAddress(addressB);
			GoToMemoryAddressNew(addressA);
			bf += "]";
			AfterGoToMemoryAddress(addressA);
			codeDepth--;
		}

		public static void MultiplyAddresses(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress endAddress)
		{
			codeDepth++;
			StartMathOperation(addressA, addressB, endAddress);
			if (commentCode) AddCommentInNewLine("current address with next address and store result in the address after");
			bf += "[>[->+>+<<]>>[-<<+>>]<<<-]";
			EndMathOperation(addressA, addressB, endAddress);
			codeDepth--;
		}

		public static void AddAddresses(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress endAddress)
		{
			codeDepth++;
			BrainfuckAddress tmpAAddress = GetBFCompilerMemoryAddress(0);
			BrainfuckAddress tmpBAddress = GetBFCompilerMemoryAddress(1);

			Copy(addressA, tmpAAddress);
			Copy(addressB, tmpBAddress);
			GoToMemoryAddressNew(tmpAAddress); // compiler addresses don't need a back

			bf += "[->+<]";
			if (commentCode) AddCommentInNewLine("Add current address to next address");

			Copy(tmpBAddress, endAddress);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
			codeDepth--;
		}

		public static void SubstractAddresses(BrainfuckAddress addressA, BrainfuckAddress addressB, BrainfuckAddress endAddress)
		{
			codeDepth++;
			BrainfuckAddress tmpAAddress = GetBFCompilerMemoryAddress(0);
			BrainfuckAddress tmpBAddress = GetBFCompilerMemoryAddress(1);

			Copy(addressA, tmpAAddress);
			Copy(addressB, tmpBAddress);
			GoToMemoryAddressNew(tmpAAddress); // compiler addresses don't need a back

			if (commentCode) AddCommentInNewLine("Subtract current address from next address");
			bf += "[->-<]";

			Copy(tmpBAddress, endAddress);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
			codeDepth--;
		}

		public static BrainfuckAddress GetBFCompilerMemoryAddress(int address)
		{
			
			return new BrainfuckAddress(-reservedMemoryLength + address, true);
		}

		public static void GoToMemoryAddressNew(BrainfuckAddress address)
		{
			codeDepth++;
			if (commentCode) AddCommentInNewLine("Move pointer from " + currentMemoryAddress + " to " + address);
			if(address.isPointer) {
				Copy(address.AsNonPointer(), GetBFCompilerMemoryAddress(15));
				GoToMemoryAddressNew(GetBFCompilerMemoryAddress(15));
				if(commentCode) AddCommentInNewLine("Follow pointer and leaving a trace");
				bf += "[>>[-]<<[>>+<<-]+>>-]+>"; // follow pointer and leave a trace
			} else {
				bf += GetAddressMoveNonPointer(currentMemoryAddress - address);
				currentMemoryAddress.address = address.address;
			}
			codeDepth--;
		}

		public static void AfterGoToMemoryAddress(BrainfuckAddress address) {
			if(address.isPointer) {
				if(commentCode) AddCommentInNewLine("tracing back from pointer");
				bf += "<[-<<]>>"; // follow trace back
			}
		}

		public static void AddCommentInNewLine(string comment)
		{
			if (!bf.EndsWith("\n")) bf += "\n";
			bf += ";;" + new string('\t', codeDepth) + SanitizeComment(comment) + "\n";
		}
	}

	public class BrainfuckAddress {
		public int address {get;set;} = 0;
		// for variables
		public int programAddress {get;set;} = 0;
		public bool isPointer {get;set;} = false;
		public bool isCompilerAddress {get;set;} = false;

		public BrainfuckAddress AsNonPointer() {
			return new BrainfuckAddress(address);
		}

		public BrainfuckAddress Clone() {
			return new BrainfuckAddress {
				address = this.address,
				programAddress = this.programAddress,
				isPointer = this.isPointer,
				isCompilerAddress = this.isCompilerAddress
			};
		}

		public void IncrementProgram() {
			address += 2;
		}

		public BrainfuckAddress() {}
		public BrainfuckAddress(int address, bool isCompilerAddress = false) {
			this.address = address;
			this.isCompilerAddress = isCompilerAddress;
		}

		public BrainfuckAddress(int address, int programAddress) {
			this.address = address;
			this.programAddress = programAddress;
		}

		public static BrainfuckAddress operator ++(BrainfuckAddress a) {
			a.address++;
			return a;
		}

		public static BrainfuckAddress operator -(BrainfuckAddress a, BrainfuckAddress b) {
			if(a.isPointer || b.isPointer) {
				throw new Exception("Pointer arithmatic is currently not supported");
			}
			return new BrainfuckAddress(a.address - b.address);
		}

        public override string ToString()
        {
            return "@" + (isPointer ? "*" : "") + address + " (real: " + Program.GetRealAddress(this) + (isCompilerAddress ? "; compiler": "") + ")";
        }
    }

	public class BrainfuckMacro {
		public string content {get;set;} = "";
		public string name {get;set;} = "";
		public int argumentCount {get;set;} = 0;

		public string Expand(int line, List<string> arguments) {
			if(arguments.Count != argumentCount) {
				Program.Error(line, "Expected " + argumentCount + " arguments but " + arguments.Count + " were given.");
			}
			string expanded = content;
			for (int i = 0; i < arguments.Count; i++) {
				expanded = expanded.Replace("$" + i, arguments[i]);
			}
			return expanded.TrimEnd('\n');
		}
	}
}