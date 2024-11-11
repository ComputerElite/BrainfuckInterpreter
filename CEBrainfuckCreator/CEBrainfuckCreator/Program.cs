using System.ComponentModel;
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
		public const int reservedMemoryLength = 34;
		public static Dictionary<string, BrainfuckAddress> variables = new Dictionary<string, BrainfuckAddress>();
		public static Dictionary<string, BrainfuckAddress> freedVars = new Dictionary<string, BrainfuckAddress>();

		// compiler options
		public static bool stripComments;
		public static bool commentCode;
		public static bool minify;
		public static bool oMovement;
		public static bool seperateStateMachine;
		public static bool use32Bit;
		public static uint cellSize = 255;
		public const string allowedChars = "<>+\\-\\[\\].,#";
		public static Dictionary<string, int> labels = new Dictionary<string, int>();
		public static Dictionary<string, BrainfuckMacro> macros = new Dictionary<string, BrainfuckMacro>();
		public static int totalInstructionCount = 0;

		public static void Main(string[] args)
		{
			try
			{
				Generate(args.Length > 0 ? args[0] : "test.cebf",args.Length > 1 ? args[1] : "compiled.bf");
			}
			catch (Exception e)
			{
				Error(currentLine, "Error during compilation, check above for more info");
				Console.WriteLine("Error during compilation, check above for more info " + e.ToString());
			}
		}

		public static void Error(int line, string error) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine("Error: " + lines[line].ToLineString() + "\n        " + error);
			throw new Exception();
		}
		public static void Warning(int line, string warning) {
			Console.ForegroundColor = ConsoleColor.Yellow;
			Console.WriteLine("Warning: " + lines[line].ToLineString() + "\n        " + warning);
		}
		public static List<BrainfuckLine> lines = new List<BrainfuckLine>();

		private static void AddPredefinedVariables() {
			foreach(int addressInt in tmpAddressesInt) {
				tmpAddresses.Add(GetBFCompilerMemoryAddress(addressInt));
			}

			for(int i = 0; i < reservedMemoryLength; i++) {
				// perhaps it's gonna bite me that I assign cebf_compiler addresses and cebf_stdlib under seperate names to the same address. Oh boy...
				AssignVariable("cebf_compiler_" + i, GetBFCompilerMemoryAddress(i));
			}
			for(int i = 0; i < standardLibraryAddressesInt.Count; i++) {
				AssignVariable("cebf_stdlib_" + i, GetBFCompilerMemoryAddress(standardLibraryAddressesInt[i]));
			}
		}

		private static void AssignVariable(string name, BrainfuckAddress address) {
			if (!variables.ContainsKey(name)) variables.Add(name, address);
			address.name = name;
			variables[name] = address;
			if (commentCode) bf += ";; Assigned memory address " + address + " the name '" + name + "'\n";
		}

		private static void FindLabels() {
			totalInstructionCount = 0;
			for(currentLine = 0; currentLine < lines.Count; currentLine++)
			{
				if (lines[currentLine].CanBeIgnoredForInstructionCounter()) continue;
				totalInstructionCount++;
				if(lines[currentLine].StartsWith(":")) {
					string label = lines[currentLine].Substring(1).Split(' ')[0];
					Console.WriteLine("found label " + label + " at " + totalInstructionCount);
					labels.Add(label, totalInstructionCount);
				}
			}
		}

		public const int instructionPointerAddressInt = 10;
		public const int ifValueAddressInt = 13;
		public const int ifTrueAddressInt = 14;
		public static List<int> tmpAddressesInt = new List<int> {15,16,17,18,19,20};
		public const int pointerAddressInt = 33;
		public static List<int> standardLibraryAddressesInt = new List<int> {7, 8, 9, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32};

		public static void Generate(string file = "test.cebf", string outputFile = "compiled.bf")
		{
			lines = BrainfuckLine.FromFile(file);
			
			
			lines = HandleIncludes(lines, file);
			TrimLines();
			AddPredefinedVariables();

			int instructionCounter = 1;


			// Compiler memory layout (as per GetBFCompilerMemoryAddress)
			// -2: interpreter reserved
			// -1: interpreter reserved
			// 0: math a
			// 1: math b
			// 2: math result
			// 3: logic gates tmp (NAND)
			// 4: logic gates tmp (XOR)
			// 5: logic gates tmp (XOR)
			// 6: logic gates tmp (XOR)
			// 7: Standard library reserved
			// 8: Standard library reserved
			// 9: Standard library reserved
			// 10: instruction pointer
			// 11: instruction pointer copy
			// 12: instruction pointer check
			// 13: if value
			// 14: if true
			// 15: compiler tmp1
			// 16: compiler tmp2
			// 17: compiler tmp3
			// 18: compiler tmp4
			// 19: compiler tmp5
			// 20: compiler tmp6
			// 21: standard library reserved
			// 22: standard library reserved
			// 23: standard library reserved
			// 24: standard library reserved
			// 25: standard library reserved
			// 26: standard library reserved
			// 27: standard library reserved
			// 28: standard library reserved
			// 29: standard library reserved
			// 30: standard library reserved
			// 31: pointer reserved (must always be 0)
			// 32: Standard library reserved
			// 33: pointer

			BrainfuckAddress instructionPointerAddress = GetBFCompilerMemoryAddress(instructionPointerAddressInt);
			bfReal = "timeout:1000\n";
			if(lines.Any(x => x.ToLower().StartsWith("#cellsize"))) 
			{
				BrainfuckLine cellSizeLine = lines.First(x => x.ToLower().StartsWith("#cellsize"));
				try {
					cellSize = uint.Parse(cellSizeLine.Split(' ')[1]);
					bfReal += cellSizeLine + "\n";
				} catch(Exception e) {
					Warning(lines.IndexOf(cellSizeLine), "Couldn't extract cell size");
				}
			}
			// reserve first 10 memory addresses for variables of the compiler
			bfReal += ">>  ;; Reserve bf interpreter memory space\n";
			AssignVariable("cebf_interpreter_0", GetBFCompilerMemoryAddress(-2));
			AssignVariable("cebf_interpreter_1", GetBFCompilerMemoryAddress(-1));
			bfReal += new string('>', reservedMemoryLength) + "  ;; Reserve bf compiler memory space\n";
			
			bfReal += bf;
			bf = "";
			GoToMemoryAddressNew(instructionPointerAddress);
			bfReal += bf;
			bf = "";
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
			List<BrainfuckLine> currentFunction = new List<BrainfuckLine>();
			int argumentCount = 0;
			for(currentLine = 0; currentLine < lines.Count; currentLine++) {
				if(lines[currentLine].StartsWith("macroend")) {
					inFunction = false;
					macros.Add(currentFunctionName, new BrainfuckMacro {
						name = currentFunctionName,
						argumentCount = argumentCount,
						content = new List<BrainfuckLine>(currentFunction)
					});
					lines[currentLine] = ";;" + lines[currentLine];
				}
				if(inFunction) {
					currentFunction.Add(lines[currentLine].Clone());
					lines[currentLine] = ";;" + lines[currentLine];
				}
				List<string> cmds = lines[currentLine].Split(' ').ToList();
				cmds = ApplyQuotationMarkChecks(cmds);
				if(cmds.Count >0 &&cmds[0] == "macro") {
					inFunction = true;
					currentFunction.Clear();
					currentFunctionName = cmds[1];
					try {
						argumentCount = ConvertToInt(cmds[2]);
					} catch(Exception e) {
						Error(currentLine, "argument count is not a valid number");
					}
					lines[currentLine] = ";;" + lines[currentLine];
				}
			}

			bfReal += "\n\n;; Found macros start\n";
			foreach (KeyValuePair<string,BrainfuckMacro> brainfuckMacro in macros)
			{
				bfReal += SanitizeComment(brainfuckMacro.Key + " with " + brainfuckMacro.Value.argumentCount + " arguments and " + brainfuckMacro.Value.content.Count + " lines\n");
			}

			bfReal += "\n;; Found macros end\n\n";
			// Expand all macros
			ExpandAllMacros();



			FindLabels(); // MUST occur right before here
			if(lines.Any(x => x.Contains("#produceprecompilecebf"))) {
				File.WriteAllText(outputFile + ".cebf", String.Join('\n', lines));
			}

			// Preprocess variable allocation and freeing
			List<BrainfuckAddress> currentlyAllocated = new List<BrainfuckAddress>();
			List<string> variablesThatWereAllocated = new List<string>();
			List<int> allocatedProgramAddresses = new List<int>();
			int maxAllocatedMemory = 0;
			
			
			for (currentLine = 0; currentLine < lines.Count; currentLine++)
			{
				if (lines[currentLine].content == "") lines[currentLine].content = ";; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩";
				bfReal += "\n;;" + SanitizeComment(lines[currentLine].content) + "\n";
				int commentIndex = lines[currentLine].IndexOf(";;");
				if(commentIndex != -1) lines[currentLine].content = lines[currentLine].Substring(0, commentIndex);
				List<string> cmds = lines[currentLine].Split(' ').ToList();
				cmds = ApplyQuotationMarkChecks(cmds);
				string cmd = cmds.Count == 0 ? "" : cmds[0];
				if (lines[currentLine].CanBeIgnoredForInstructionCounter()) continue;
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
					case "all":
						string allocatedName = cmds[1];
						if (variablesThatWereAllocated.Contains(allocatedName))
						{
							Error(currentLine, "The variable "+ allocatedName + " was allocated before. You cannot allocate the same variable twice as variable names are global");
							return;
						}
						int neededMemory = ConvertToInt(cmds[2]);
						// get free address
						int freeAddress = 0;
						for (freeAddress = 0; freeAddress < 100000; freeAddress++)
						{
							if (allocatedProgramAddresses.Contains(freeAddress)) continue;
							bool hasEnoughSpace = true;
							for (int j = freeAddress + 1; j < freeAddress + neededMemory; j++)
							{
								if (allocatedProgramAddresses.Contains(j))
								{
									hasEnoughSpace = false;
								}
							}

							if (hasEnoughSpace) break;
						}

						for (int i = freeAddress; i < freeAddress + neededMemory; i++)
						{
							allocatedProgramAddresses.Add(i);
							if (i > maxAllocatedMemory) maxAllocatedMemory = i; // keep track of what's the max memory we needed
						}
						variablesThatWereAllocated.Add(allocatedName);
						BrainfuckAddress allocated = new BrainfuckAddress(ProgramAddressToCompiledAddress(freeAddress),
							allocatedName, freeAddress);
						allocated.allocatedLength = neededMemory;
						currentlyAllocated.Add(allocated);
						AssignVariable(allocatedName, allocated);
						break;
					case "fre":
						string freeName = cmds[1];
						BrainfuckAddress? varToFree = currentlyAllocated.Find(x => x.name == freeName);
						if (varToFree == null)
						{
							
							Error(currentLine, "The variable " + freeName + " is not allocated here. Allocated vars are: " + String.Join(", ", currentlyAllocated.Select(x => x.name)));
							return;
						}

						currentlyAllocated.Remove(varToFree);
						for (int i = varToFree.programAddress;
						     i < varToFree.programAddress + varToFree.allocatedLength;
						     i++)
						{
							allocatedProgramAddresses.Remove(i);
						}

						varToFree.freedAt = lines[currentLine];
						freedVars.Add(freeName, varToFree);
						variables.Remove(freeName);
						break;
					case "raw":
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddressNew(addressA);
						cmds.RemoveAt(0);
						cmds.RemoveAt(0);
						if(commentCode) bf += "\n;; Raw code" + "\n";
						bf += String.Join(' ', cmds);
						AfterGoToMemoryAddress(addressA);
						break;
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
					case "exit":
						bf += new string('+', GetInstructionDiff(instructionCounter, totalInstructionCount-1));
						nextInstruction = instructionCounter;
						break;
					case "sad":
						int programAddress = ConvertToInt(cmds[1]);
						string name = cmds[2];
						addressA = new BrainfuckAddress(ProgramAddressToCompiledAddress(programAddress), name, programAddress);
						AssignVariable(name, addressA);
						break;
					case "set.c":
						addressA = GetAddress(cmds[1]);
						value = cmds[2][0];
						SetAddressValue(addressA, value);
						break;
					case "set.s":
						addressA = GetAddress(cmds[1]);
						cmds.RemoveAt(0);
						cmds.RemoveAt(0);
						foreach (char c in String.Join(' ', cmds))
						{
							SetAddressValue(addressA, c);
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
						bf += "+";
						AfterGoToMemoryAddress(addressA);
						break;
					case "dec":
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddressNew(addressA);
						bf += "-";
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
						bf += "[.>+>]<[-<<]>";
						AfterGoToMemoryAddress(addressA);
						break;
					case "wrt.s":
						// writes a string to the output
						cmds.RemoveAt(0);
						string s = String.Join(" ", cmds).Replace("\\n", "\n").Replace("\\r", "\r");
						OutputString(s);
						break;
					case "wrt.n":
						// writes a string to the output
						OutputString("\0");
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
				GoToMemoryAddressNew(instructionPointerAddress); // we can ignore going back as the instruction pointer itself isn't considered a pointer in my definition of a pointer as a memory address
				int instructionDiff = GetInstructionDiff(instructionCounter, nextInstruction);
				string instruction = bf;
				string instructionPointerIncrementer = new string('+', instructionDiff);
				
				bf = "";
				if(seperateStateMachine) instruction = "\n       " + instruction + "\n";
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


			// Output assigned addresses
			string addressMappingString = "";
			foreach(KeyValuePair<string, BrainfuckAddress> a in variables) {
				addressMappingString += ";; " + SanitizeComment(a.Value.ToString() + "\n");
			}
			finalBF = addressMappingString + finalBF;
			if (minify)
			{
				finalBF = Regex.Replace(finalBF, "[^" + allowedChars + "]", "");
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


			//Console.WriteLine("Finished bf: \n\n" + finalBF);
			//ClipboardService.SetText(finalBF);
			File.WriteAllText(outputFile, finalBF);
		}

		public static List<string> ApplyQuotationMarkChecks(List<string> cmds)
		{
			bool inQuotationMark = false;
			List<string> newCmds = new List<string>();
			foreach (string s in cmds)
			{
				if (s.StartsWith(";;")) break;
				bool wasInQuotationMark = inQuotationMark;
				string nS = s.Replace("\\\"", "\"");
				if (s.StartsWith("\""))
				{
					inQuotationMark = true;
					nS = s.Substring(1);
				}
				if (s.EndsWith("\"") && !s.EndsWith("\\\""))
				{
					inQuotationMark = false;
					nS = s.Substring(0, s.Length - 1);
				}
				if (wasInQuotationMark) newCmds[^1] += " " + nS;
				else newCmds.Add(nS);
			}

			return newCmds;
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
						lines[i].content = SanitizeComment(lines[i].content);
					}
				}
			}
		}

		private static void TrimLines()
		{
			// Prepare lines: trim
			for (int i = 0; i < lines.Count; i++)
			{
				lines[i].content = lines[i].content.Trim();
				if(lines[i].content == ""){
					lines.RemoveAt(i);
					i--;
				}
			}
		}

		private static List<string> alreadyIncludedFiles = new List<string>();
		
		private static List<BrainfuckLine> ResolveFile(string name, string fileItsIncludedFrom)
		{
			string path;
			if (fileItsIncludedFrom.Contains("/"))
			{
				path = Path.GetDirectoryName(fileItsIncludedFrom) + "/" + name;
			}
			else
			{
				path = name;
			}

			if (alreadyIncludedFiles.Contains(path)) return new List<BrainfuckLine>();// already included
			if(File.Exists(path)) {
				Console.WriteLine("Including: " + path);
				alreadyIncludedFiles.Add(path);
			} else {
				Error(currentLine, "File not found: " + path);
				return new List<BrainfuckLine>();
			}
			return HandleIncludes(BrainfuckLine.FromFile(path), path);
		}

		private static List<BrainfuckLine> HandleIncludes(List<BrainfuckLine> currentFileLines, string file)
		{
			for (int i = 0; i < currentFileLines.Count; i++)
			{
				List<string> cmds = currentFileLines[i].Split(' ').ToList();
				if (cmds[0] == "#include")
				{
					cmds.RemoveAt(0);
					string includeFile = String.Join(' ', cmds);
					List<BrainfuckLine> includeLines = ResolveFile(includeFile, file);
					currentFileLines.RemoveAt(i);
					currentFileLines.InsertRange(i, includeLines);
				}
			}

			return currentFileLines;
		}

		public static void ExpandAllMacros() {
			bool expandedMacro = true;
			while(expandedMacro) {
				expandedMacro = false;
				List<BrainfuckLine> expandedCode = new List<BrainfuckLine>();
				for(int i = 0; i < lines.Count; i++) {
					List<string> cmds = lines[i].Split(' ').ToList();
					cmds = ApplyQuotationMarkChecks(cmds);
					if (cmds.Count == 0)
					{
						expandedCode.Add(lines[i]);
						continue;
					}
					string macroName = cmds[0];
					cmds.RemoveAt(0);
					if(!macros.ContainsKey(macroName)) {
						expandedCode.Add(lines[i]);
						continue;
					}
					expandedMacro = true;
					if (commentCode) expandedCode.Add(BrainfuckLine.CompilerNote(";; entering macro " + macroName));
					expandedCode.AddRange(macros[macroName].Expand(i, cmds));
					if(commentCode) expandedCode.Add(BrainfuckLine.CompilerNote(";; exiting macro " + macroName));
				}

				lines = expandedCode;
			}
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
			} else if(instructionDiff < 0)
			{
				instructionDiff =
					totalInstructionCount - instructionCounter + nextInstruction +
					1; // Warning: I do not know why I have to add 1 here so this may screw me over
			}
			if(commentCode) bfReal += ";; Instruction diff: " + instructionDiff + "    next: " + nextInstruction + "     counter: " + instructionCounter + "\n";
			if (instructionDiff > cellSize)
			{
				Warning(currentLine,
					"Instruction pointer set to " + instructionDiff +
					". As this is greater than "  + cellSize + " (the currently selected cell size) the wrong instruction will execute if your interpreter uses memory cells <= " + ((int)Math.Log2(cellSize)) + " bits.");
			}
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
			BrainfuckAddress tmpValueAddress = GetBFCompilerMemoryAddress(ifValueAddressInt);
			BrainfuckAddress tmpTrueAddress = GetBFCompilerMemoryAddress(ifTrueAddressInt);

			// store value
			Copy(address, tmpValueAddress);
			//codeDepth--;
			//return;
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
			BrainfuckAddress tmpAddress = GetUnusedTmpAddress();
			GoToMemoryAddressNew(tmpAddress); // compiler addresses don't need a back
			foreach (char c in s)
			{
				bf += "[-]" + new string('+', c) + ".";
			}
			bf += "[-]";
			FreeTmpAddress(tmpAddress);
		}

		public static string GetOutputStringCode(string s)
		{ 
			BrainfuckAddress tmpAddress = GetUnusedTmpAddress();
			GoToMemoryAddressNew(tmpAddress); // compiler addresses don't need a back
			foreach (char c in s)
			{
				bf += "[-]" + new string('+', c) + ".";
			}
			bf += "[-]";
			FreeTmpAddress(tmpAddress);
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
			int tmpAddress = address.address + reservedMemoryLength + 2; // + 2 for interpreter reserved address
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
			Copy(addressA, tmpAAddress);
			Copy(addressB, tmpBAddress);
			ResetAddressValue(addressC);
			GoToMemoryAddressNew(tmpAAddress); // compiler addresses don't need a back
		}

		public static void StartMathOperation(BrainfuckAddress addressA, BrainfuckAddress addressB)
		{
			BrainfuckAddress tmpAAddress = GetBFCompilerMemoryAddress(0);
			ResetAddressValue(tmpAAddress);
			Copy(addressA, tmpAAddress);
			ResetAddressValue(addressB);
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
				} else
				{
					string extraInfo = "";
					if (freedVars.ContainsKey(varName))
					{
						BrainfuckAddress freedVar = freedVars[varName];
						extraInfo = " It has been freed in line " + freedVar.freedAt.FileAndLine + ": \n" + freedVar.freedAt.ToLineString();
					}
					Error(currentLine, "Variable '" + varName + "' does not exist." + extraInfo);
				}
				return a;
			}

			return new BrainfuckAddress(ProgramAddressToCompiledAddress(ConvertToInt(address)), "",
				ConvertToInt(address));
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
			BrainfuckAddress tmpAddress = GetUnusedTmpAddress();
			ResetAddressValue(addressB);
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
			FreeTmpAddress(tmpAddress);
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
			if (commentCode) AddCommentInNewLine("multiply current address with next address and store result in the address after");
			bf += ">>[-]>[-]<<<[>[->+>+<<]>>[-<<+>>]<<<-]";
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
			return new BrainfuckAddress(-reservedMemoryLength + address, "cebf_compiler_" + address, true);
		}

		public static List<BrainfuckAddress> tmpAddresses = new List<BrainfuckAddress> {
		};
		public static BrainfuckAddress GetUnusedTmpAddress() {
			if(tmpAddresses.Count <= 0) {
				throw new Exception("No tmp compiler addresses free anymore");
			}
			BrainfuckAddress addressToReturn = tmpAddresses[0];
			tmpAddresses.RemoveAt(0);
			return addressToReturn;
		}

		public static void FreeTmpAddress(BrainfuckAddress address) {
			tmpAddresses.Add(address);
		}

		public static void GoToMemoryAddressNew(BrainfuckAddress address)
		{
			codeDepth++;
			if (commentCode) AddCommentInNewLine("Move pointer from " + currentMemoryAddress + " to " + address);
			if(address.isPointer) {
				Copy(address.AsNonPointer(), GetBFCompilerMemoryAddress(pointerAddressInt));
				GoToMemoryAddressNew(GetBFCompilerMemoryAddress(pointerAddressInt));
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
			bf += ";;" + new string(' ', codeDepth * 4) + SanitizeComment(comment) + "\n";
		}
	}

	public class BrainfuckAddress {
		public int address {get;set;} = 0;
		// for variables
		public int programAddress {get;set;} = 0;
		public bool isPointer {get;set;} = false;
		public bool isCompilerAddress {get;set;} = false;
		public int allocatedLength { get; set; } = -1;
		public BrainfuckLine freedAt { get; set; } = new BrainfuckLine("", "", -1);
		public string name {get;set;} = "";

		public BrainfuckAddress AsNonPointer() {
			return new BrainfuckAddress(address, name);
		}

		public BrainfuckAddress Clone() {
			return new BrainfuckAddress {
				address = this.address,
				programAddress = this.programAddress,
				isPointer = this.isPointer,
				isCompilerAddress = this.isCompilerAddress,
				name = this.name
			};
		}

		public void IncrementProgram() {
			address += 2;
		}

		public BrainfuckAddress() {}
		public BrainfuckAddress(int address) {
			this.address = address;
		}

		public BrainfuckAddress(int address, string name, bool isCompilerAddress = false) {
			this.address = address;
			this.isCompilerAddress = isCompilerAddress;
			this.name = name;
		}

		public BrainfuckAddress(int address, string name, int programAddress) {
			this.address = address;
			this.programAddress = programAddress;
			this.name = name;
		}

		public static BrainfuckAddress operator ++(BrainfuckAddress a) {
			a.address++;
			return a;
		}

		public static BrainfuckAddress operator -(BrainfuckAddress a, BrainfuckAddress b) {
			if(a.isPointer || b.isPointer) {
				throw new Exception("Pointer arithmetic is currently not supported");
			}
			return new BrainfuckAddress(a.address - b.address);
		}

        public override string ToString()
        {
            return (allocatedLength == -1 ? "" : "alloc: ") + name + "@" + (isPointer ? "*" : "") + address + " (real: " + Program.GetRealAddress(this) + (isCompilerAddress ? "; compiler": "") + ")" + (allocatedLength == -1 ? "" : "for " + allocatedLength);
        }
    }

	public class BrainfuckLine
	{
		public string content = "";
		public int orgFileLine = -1;
		public string orgFile = "";

		public static BrainfuckLine operator +(string a, BrainfuckLine b)
		{
			b.content = a + b.content;
			return b;
		}

		public string FileAndLine
		{
			get
			{
				return orgFile + ":" + orgFileLine;
			}
		}

		public bool Contains(string value)
		{
			return content.Contains(value);
		}
		
		public override string ToString()
		{
			return content;
		}

		public List<string> Split(char splitCharacter)
		{
			return content.Split(splitCharacter).ToList();
		}

		public bool StartsWith(string value)
		{
			return content.StartsWith(value);
		}

		public string Substring(int startIndex)
		{
			return content.Substring(startIndex);
		}
		public string Substring(int startIndex, int endIndex)
		{
			return content.Substring(startIndex, endIndex);
		}

		public int IndexOf(string value)
		{
			return content.IndexOf(value);
		}
		
		public string ToLower()
		{
			return content.ToLower();
		}
		
		public BrainfuckLine(string content, string orgFile, int orgFileLine)
		{
			this.orgFileLine = orgFileLine;
			this.content = content;
			this.orgFile = orgFile;
		}

			public static List<BrainfuckLine> FromFile(string file)
		{
			List<BrainfuckLine> bl = new List<BrainfuckLine>();
			string[] lines = File.ReadAllLines(file);
			for (int i = 0; i < lines.Length; i++)
			{
				bl.Add(new BrainfuckLine(lines[i], file, i + 1) );
			}

			return bl;
		}

		public static BrainfuckLine CompilerNote(string content)
		{
			return new BrainfuckLine(content, "compiler generated", -1);
		}

		public string ToLineString()
		{
			return FileAndLine + "    " + content;
		}

		public BrainfuckLine Clone()
		{
			return new BrainfuckLine(content, orgFile, orgFileLine);
		}

		public bool CanBeIgnoredForInstructionCounter()
		{
			if (content.StartsWith("#")) return true;
			int length = content.IndexOf(';');
			if(length == -1) length = content.Length;
			string tmpLine = content.Substring(0, length).Trim();
			return tmpLine == "";
		}
	}

	public class BrainfuckMacro
	{
		public List<BrainfuckLine> content { get; set; } = new List<BrainfuckLine>();
		public string name {get;set;} = "";
		public int argumentCount {get;set;} = 0;
		public int callsSoFar { get; set; } = 0;

		private string Callify(string varOrLabel)
		{
			return varOrLabel + "___call_" + callsSoFar;
		}
		public List<BrainfuckLine> Expand(int line, List<string> arguments) {
			if(arguments.Count != argumentCount) {
				Program.Error(line, "Expected " + argumentCount + " arguments but " + arguments.Count + " were given.");
			}
			List<BrainfuckLine> expanded = content.ConvertAll(x => x.Clone());
			// find labels
			Dictionary<string, string> labels = new Dictionary<string, string>();
			List<string> variablesThatNeedCallification = new List<string>();
			for (int i = 0; i < expanded.Count; i++)
			{
				if (expanded[i].StartsWith(":"))
				{
					string labelName = expanded[i].Substring(1).Split(' ')[0];
					labels.Add(labelName, Callify(labelName));
					expanded[i].content =":" + labels[labelName];
				}

				List<string> words = expanded[i].Split(' ');
				string cmd = "";
				string arg1 = "";
				// find variable and already replace variable allocation and freeing
				for (int j = 0; j < words.Count; j++)
				{
					string word = words[j];
					if (word.StartsWith(";;")) break; // ignore comments
					if (j == 0)
					{
						cmd = words[j];
						continue;
					}

					if ((cmd == "sad") && j == 1)
					{
						arg1 = word;
						continue;
					}

					if (cmd == "fre" && j == 1)
					{
						expanded[i].content = "fre " + Callify(word);
						break;
					}
					if (cmd == "all" && j == 1)
					{
						variablesThatNeedCallification.Add("$" + word);
						expanded[i].content = "all " + Callify(word) + " " + words[j+1];
						break;
					}
					
					
					if (cmd == "sad" && j == 2)
					{
						expanded[i].content = "sad " + arg1 + " " + Callify(word);
						break;
					}
					
					
					string trimmedVar = word.TrimStart('*');
					if (!trimmedVar.StartsWith("$")) continue;
					int convertTest;
					if (int.TryParse(trimmedVar.Substring(1), out convertTest)) continue; // it's an argument
					if (Program.variables.ContainsKey(trimmedVar.Substring(1))) continue; // is compiler var
					if (labels.ContainsKey(word)) continue;
					if(!variablesThatNeedCallification.Contains(trimmedVar)) continue;
					labels.Add(word, Callify(word));
				}
			}
			// make sure arguments have quotation marks around them if needed and replace arguments. Also escape quotation marks.
			for (int i = 0; i < arguments.Count; i++) {
				arguments[i] = arguments[i].Replace("\"", "\\\"");
				if(arguments[i].Contains(" ")) arguments[i] = "\"" + arguments[i] + "\"";
				expanded.ForEach(x => x.content = x.content.Replace("$" + i, arguments[i]));
			}
			// replace with numbered labels
			for (int i = 0; i < expanded.Count; i++)
			{
				List<string> args = Program.ApplyQuotationMarkChecks(expanded[i].Split(' ').ToList());
				for (int j = 0; j < args.Count; j++)
				{
					if (labels.ContainsKey(args[j]))
					{
						args[j] = labels[args[j]];
					}
				}

				expanded[i].content = "";
				foreach (string arg in args)
				{
					string toInsert = arg;
					if(arg.Contains(" ")) toInsert = "\"" + arg + "\"";
					expanded[i].content += toInsert + " ";
				}
				if(expanded[i].content.EndsWith(" ")) expanded[i].content = expanded[i].Substring(0, expanded[i].content.Length - 1);
			}

			callsSoFar++;
			return expanded;
		}
	}
}