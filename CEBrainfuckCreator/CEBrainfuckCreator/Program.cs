using Microsoft.VisualBasic;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using System.Transactions;
using TextCopy;

namespace CEBrainfuckCreator
{
	public class Program
	{

		public static string bf = "";
		public static string bfReal = "";
		public static int currentMemoryAddress = 0;
		public static int currentLine = 0;
		public const int reservedMemoryLength = 13;
		public static Dictionary<string, int> variables = new Dictionary<string, int>();

		// compiler options
		public static bool stripComments;
		public static bool commentCode;
		public static bool minify;
		public static bool oMovement;
		public const string allowedChars = "<>+\\-\\[\\].,#";
		public static Dictionary<string, int> labels = new Dictionary<string, int>();
		public static Dictionary<string, BrainfuckMacro> macros = new Dictionary<string, BrainfuckMacro>();

		public static void Main(string[] args)
		{
			Generate();
		}

		public static void Error(int line, string error) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine(line + ": " + lines[line] + "\n        " + error);
		}
		public static List<string> lines = new List<string>();

		public static void Generate()
		{
			string file = "test.cebf";
			lines = File.ReadAllLines(file).ToList();

			// Prepare lines: trim
			for (int i = 0; i < lines.Count; i++)
			{
				lines[i] = lines[i].Trim();
				if(lines[i] == ""){
					lines.RemoveAt(i);
					i--;
				}
			}

			int instructionCounter = 1;


			// Reserved memory addresses
			// 0: math a
			// 1: math b
			// 2: math result
			// 3: logic gates tmp (NAND)
			// 4: logic gates tmp (XOR)
			// 5: logic gates tmp (XOR)
			// 6: logic gates tmp (XOR)
			// 7: 
			// 8: 
			// 9: copy tmp
			// 10: instruction pointer
			// 11: instruction pointer copy
			// 12: instruction pointer check

			int instructionPointerAddress = GetBFCompilerMemoryAddress(10);
			bfReal = "timeout:200\n";
			// reserve first 10 memory addresses for variables of the compiler
			bfReal += new string('>', reservedMemoryLength) + "  ;;; Reserve bf compiler memory space";
			
			GoToMemoryAddress(instructionPointerAddress);
			bfReal += bf;
			bf = "";
			bfReal += "+["; // Start state machine

			// pre compile code prepare
			stripComments = lines.Any(x => x.ToLower().StartsWith("#nocomment"));
			commentCode = lines.Any(x => x.ToLower().StartsWith("#commentcode"));
			for (int i = 0; i < lines.Count; i++)
			{
				if (lines[i].StartsWith(";;") && stripComments)
				{
					lines.RemoveAt(i);
					i--;
				}
			}

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

			for (currentLine = 0; currentLine < lines.Count; currentLine++)
			{
				if (lines[currentLine] == "") lines[currentLine] = ";; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩";
				List<string> cmds = lines[currentLine].Split(' ').ToList();
				string cmd = cmds[0];
				bfReal += "\n;;" + lines[currentLine] + "\n";
				if(lines[currentLine].StartsWith(":")) {
					string label = lines[currentLine].Substring(1);
					labels.Add(label, instructionCounter);
				}
				int addressA;
				int addressB;
				int addressC;
				int value;
				int nextInstruction = instructionCounter + 1;
				if(currentLine == lines.Count - 1) {
					nextInstruction = 0;
				}

				switch (cmd)
				{
					case "jmp":
						nextInstruction = ConvertToInt(cmds[1]);
						break;
					case "jmp/nz":
						IF(GetAddress(cmds[1]), new string('+', GetInstructionDiff(instructionCounter, GetInstruction(cmds[1]), lines)), new string('+', GetInstructionDiff(instructionCounter, nextInstruction, lines)));
						nextInstruction = instructionCounter;
						break;
					case "jmp/ez":
						IF(GetAddress(cmds[1]), new string('+', GetInstructionDiff(instructionCounter, nextInstruction, lines)), new string('+', GetInstructionDiff(instructionCounter, GetInstruction(cmds[1]), lines)));
						nextInstruction = instructionCounter;
						break;
					case "sad":
						addressA = GetAddress(cmds[1]);
						string name = cmds[2];
						if (variables.ContainsKey(name)) variables.Add(name, addressA);
						variables[name] = addressA;
						if (commentCode) bf += ";;Assigned memory address " + addressA + " the name '" + name + "'\n";
						break;
					case "dbg":
						bf += "#";
						break;
					case "stc":
						addressA = GetAddress(cmds[2]);
						value = HandleReservedValue(cmds[1][0]);
						SetAddressValue(addressA, value);
						break;
					case "sts":
						addressA = GetAddress(cmds[2]);
						foreach (char c in cmds[1])
						{
							SetAddressValue(addressA, HandleReservedValue(c));
							addressA++;
						}
						SetAddressValue(addressA, 0);
						break;
					case "stn":
						addressA = GetAddress(cmds[2]);
						value = ConvertToInt(cmds[1]);
						SetAddressValue(addressA, value);
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
					case "oua":
						// output value at address
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddress(addressA);
						bf += ".";
						break;
					case "inc":
						// input value at address
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddress(addressA);
						bf += ",";
						break;
					case "oum":
						// output value starting at address for length
						addressA = GetAddress(cmds[1]);
						value = ConvertToInt(cmds[2]);
						for (int i = 0; i < value; i++)
						{
							GoToMemoryAddress(addressA);
							bf += ".";
							addressA++;
						}
						break;
					case "oun":
						// output value starting at address till null
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddress(addressA);
						bf += "[.>]";
						break;
					case "ous":
						// output value starting at address till null
						cmds.RemoveAt(0);
						string s = String.Join(" ", cmds);
						OutputString(s);
						break;
					case "oub":
						// output value starting at address till null
						addressA = GetAddress(cmds[1]);
						IF(addressA, GetOutputStringCode("True\n"), GetOutputStringCode("False\n"));
						break;
					case "cmp":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						Compare(addressA, addressB, addressC);
						break;

					case "and":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						ANDGate(addressA, addressB, addressC);
						break;
					case "nnd":
						// output value at address
						addressA = GetAddress(cmds[1]);
						addressB = GetAddress(cmds[2]);
						addressC = GetAddress(cmds[3]);
						NANDGate(addressA, addressB, addressC);
						break;
					case "oor":
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
					case "mov":
						// output value at address
						addressA = GetAddress(cmds[1]);
						GoToMemoryAddress(addressA);
						break;
				}
				GoToMemoryAddress(instructionPointerAddress);
				int instructionDiff = GetInstructionDiff(instructionCounter, nextInstruction, lines);
				string instruction = bf + new string('+', instructionDiff);
				
				bf = "";
				bfReal += "-" + "[->+>+<<]>>[-<<+>>]<" + ">+<[>[-]<[-]]>[[-]<<" + instruction + ">>]<<";
				instructionCounter++;
			}

			bfReal += "]"; // End state machine loop

			// Compiler options:
			minify = lines.Any(x => x.ToLower().StartsWith("#minify"));
			oMovement = lines.Any(x => x.ToLower().StartsWith("#omovement"));

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

		public static int GetInstructionDiff(int instructionCounter, int nextInstruction, List<string> lines) {
				int instructionDiff = nextInstruction - instructionCounter;
				if(nextInstruction == 0) {
					instructionDiff = 0;
				} else if(instructionDiff < 0 && nextInstruction != 0) {
					instructionDiff = lines.Count - instructionCounter - instructionDiff - 1;
				}
				return instructionDiff;
		}

		/////////////////////// Helper methods

		/// <summary>
		/// EXPERIMENTAL!!! DO NOT ALTER MEMORY WITH THIS METHOD. YOU WILL MOST LIKELY FUCK YOUR MEMORY UP
		/// </summary>
		public static void IF(int address, string onTrue, string onFalse)
		{
			int startAddress = currentMemoryAddress;
			int tmpValueAddress = GetBFCompilerMemoryAddress(0);
			int tmpTrueAddress = GetBFCompilerMemoryAddress(1);

			// store value
			Copy(address, tmpValueAddress);
			SetAddressValue(tmpTrueAddress, 1);
			GoToMemoryAddress(tmpValueAddress);
			string moveToStartAddressCode = GetAddressMove(tmpTrueAddress - startAddress);
			string moveBackCode = GetAddressMove(startAddress - tmpTrueAddress);
			bf += "[[-]>[-]" + moveToStartAddressCode + onTrue + moveBackCode + "<]>[[-]" + moveToStartAddressCode + onFalse + moveBackCode + "]<";
		}

		public static void Compare(int addressA, int addressB, int addressC) {
			
			// compare addressA to addressB and set C to 1 if a ist larger than b
            
		}

		public static void OutputString(string s)
		{
			GoToMemoryAddress(GetBFCompilerMemoryAddress(9));
			foreach (char c in s)
			{
				bf += "[-]" + new string('+', c) + ".";
			}
			bf += "[-]";
		}

		public static string GetOutputStringCode(string s)
		{ 
			string bf = GetAddressMove(currentMemoryAddress - GetBFCompilerMemoryAddress(9));
			foreach (char c in s)
			{
				bf += "[-]" + new string('+', c) + ".";
			}
			bf += "[-]";
			bf += GetAddressMove(GetBFCompilerMemoryAddress(9) - currentMemoryAddress);
			return bf;
		}

		public static void NANDGate(int addressA, int addressB, int addressC)
		{
			StartMathOperation(addressA, addressB, addressC);
			if (commentCode) AddCommentInNewLine("Perform XOR operation on " + GetRealAddress(addressA) + " and " + GetRealAddress(addressB) + " and store result in " + GetRealAddress(addressC) + " (AND Gate with inverted result)");
			// And gate
			bf += "[->+<]++[->-<]>>[-]+<[>-<[-]]<";
			GoToMemoryAddress(GetBFCompilerMemoryAddress(2));
			// not gate
			bf += ">[-]+<[>-<[-]]";
			MoveValue(GetBFCompilerMemoryAddress(3), GetBFCompilerMemoryAddress(2));

			EndMathOperation(addressA, addressB, addressC);
		}
		

		public static void NOTGate(int addressA, int addressB)
		{
			StartMathOperation(addressA, addressB);
			if (commentCode) AddCommentInNewLine("Perform NOT operation on " + GetRealAddress(addressA) + " and store result in " + GetRealAddress(addressB));
			bf += ">[-]+<[>-<[-]]";
			EndMathOperation(addressA, addressB);
		}

		public static void ANDGate(int addressA, int addressB, int addressC)
		{
			StartMathOperation(addressA, addressB, addressC);
			if (commentCode) AddCommentInNewLine("Perform AND operation on " + GetRealAddress(addressA) + " and " + GetRealAddress(addressB) + " and store result in " + GetRealAddress(addressC));
			bf += "[->+<]++[->-<]>>[-]+<[>-<[-]]<";
			EndMathOperation(addressA, addressB, addressC);
		}

		public static void XORGate(int addressA, int addressB, int addressC)
		{
			// memory space compiler:
			// 0: reserved for nand gate
			// 1: reserved for nand gate
			// 2: reserved for nand gate
			// 3: reserved for nand gate
			// 4: AB
			// 5: AAB
			// 6: BAB

			// allocate required addresses
			int tmpAB = GetBFCompilerMemoryAddress(4);
			int tmpAAB = GetBFCompilerMemoryAddress(5);
			int tmpBAB = GetBFCompilerMemoryAddress(6);

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

		}

		public static int GetRealAddress(int address)
		{
			return address + reservedMemoryLength;
		}

		public static void ORGate(int addressA, int addressB, int addressC)
		{
			StartMathOperation(addressA, addressB, addressC);
			if (commentCode) AddCommentInNewLine("Perform OR operation on " + GetRealAddress(addressA) + " and " + GetRealAddress(addressB) + " and store result in " + GetRealAddress(addressC));
			bf += "[->+<]>>[-]<[>+<[-]]<";
			EndMathOperation(addressA, addressB, addressC);
		}

		public static void StartMathOperation(int addressA, int addressB, int addressC)
		{
			int tmpAAddress = GetBFCompilerMemoryAddress(0);
			int tmpBAddress = GetBFCompilerMemoryAddress(1);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
			ResetAddressValue(addressC);
			Copy(addressA, tmpAAddress);
			Copy(addressB, tmpBAddress);
			GoToMemoryAddress(tmpAAddress);
		}

		public static void StartMathOperation(int addressA, int addressB)
		{
			int tmpAAddress = GetBFCompilerMemoryAddress(0);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(addressB);
			Copy(addressA, tmpAAddress);
			GoToMemoryAddress(tmpAAddress);
		}

		public static void EndMathOperation(int addressA, int addressB)
		{
			int tmpAAddress = GetBFCompilerMemoryAddress(0);
			int tmpBAddress = GetBFCompilerMemoryAddress(1);
			Copy(tmpBAddress, addressB);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
			GoToMemoryAddress(addressB);
		}

		public static void EndMathOperation(int addressA, int addressB, int addressC)
		{
			int tmpAAddress = GetBFCompilerMemoryAddress(0);
			int tmpBAddress = GetBFCompilerMemoryAddress(1);
			int tmpCAddress = GetBFCompilerMemoryAddress(2);
			Copy(tmpCAddress, addressC);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
			ResetAddressValue(tmpCAddress);
			GoToMemoryAddress(addressC);
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

		public static int GetAddress(string address)
		{
			if (address.StartsWith("$"))
			{
				string varName = address.Substring(1);
				if (variables.ContainsKey(varName))
				{
					return variables[varName];
				}
				return 0;
			}
			return ConvertToInt(address);
		}

		public static void SetAddressValue(int address, int value)
		{
			GoToMemoryAddress(address);
			SetCurrentAddressValue(value);
		}

		public static void ResetAddressValue(int address)
		{
			GoToMemoryAddress(address);
			if (commentCode) AddCommentInNewLine("Set address value to 0");
			bf += "[-]";
		}

		public static void SetCurrentAddressValue(int value)
		{
			// set value;
			if (commentCode) AddCommentInNewLine("Set address value to " + value);
			bf += "[-]" + new string('+', value);
		}
		public static string GetAddressMove(int diff)
		{
			// set value;
			char sign = diff > 0 ? '<' : '>';
			return new string(sign, Math.Abs(diff));
		}

		public static void Copy(int addressA, int addressB)
		{
			int tmpAddress = GetBFCompilerMemoryAddress(9);
			ResetAddressValue(tmpAddress);
			MoveValue(addressA, tmpAddress);
			GoToMemoryAddress(tmpAddress);
			if (commentCode) AddCommentInNewLine("Move value from address " + GetRealAddress(tmpAddress) + " into " + GetRealAddress(addressA) + " and " + GetRealAddress(addressB));
			bf += "[-" + GetAddressMove(tmpAddress - addressA) + "+" + GetAddressMove(addressA - addressB) + "+" + GetAddressMove(addressB - tmpAddress) + "]";
			GoToMemoryAddress(tmpAddress);
		}

		public static void MoveValue(int addressA, int addressB)
		{
			ResetAddressValue(addressB);
			GoToMemoryAddress(addressA);
			if (commentCode) AddCommentInNewLine("Move value from address " + GetRealAddress(addressA) + " into " + GetRealAddress(addressB));
			bf += "[-" + GetAddressMove(addressA - addressB) + "+" + GetAddressMove(addressB - addressA) + "]";
		}

		public static void MultiplyAddresses(int addressA, int addressB, int endAddress)
		{
			StartMathOperation(addressA, addressB, endAddress);
			if (commentCode) AddCommentInNewLine("current address with next address and store result in the address after");
			bf += "[>[->+>+<<]>>[-<<+>>]<<<-]";
			EndMathOperation(addressA, addressB, endAddress);
		}

		public static void AddAddresses(int addressA, int addressB, int endAddress)
		{
			int tmpAAddress = GetBFCompilerMemoryAddress(0);
			int tmpBAddress = GetBFCompilerMemoryAddress(1);

			Copy(addressA, tmpAAddress);
			Copy(addressB, tmpBAddress);
			GoToMemoryAddress(tmpAAddress);

			bf += "[->+<]";
			if (commentCode) AddCommentInNewLine("Add current address to next address");

			Copy(tmpBAddress, endAddress);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
		}

		public static void SubstractAddresses(int addressA, int addressB, int endAddress)
		{
			int tmpAAddress = GetBFCompilerMemoryAddress(0);
			int tmpBAddress = GetBFCompilerMemoryAddress(1);

			Copy(addressA, tmpAAddress);
			Copy(addressB, tmpBAddress);
			GoToMemoryAddress(tmpAAddress);

			if (commentCode) AddCommentInNewLine("Subtract current address from next address");
			bf += "[->-<]";

			Copy(tmpBAddress, endAddress);
			ResetAddressValue(tmpAAddress);
			ResetAddressValue(tmpBAddress);
		}

		public static int GetBFCompilerMemoryAddress(int address)
		{
			return -reservedMemoryLength + address;
		}

		public static void GoToMemoryAddress(int address)
		{

			if (commentCode) AddCommentInNewLine("Move pointer from address " + GetRealAddress(currentMemoryAddress) + " to " + GetRealAddress(address));
			bf += GetAddressMove(currentMemoryAddress - address);
			currentMemoryAddress = address;
		}

		public static void AddCommentInNewLine(string comment)
		{
			if (!bf.EndsWith("\n")) bf += "\n";
			bf += ";;   " + comment + "\n";
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