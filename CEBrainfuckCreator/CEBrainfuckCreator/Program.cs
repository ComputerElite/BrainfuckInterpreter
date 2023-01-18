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
		public static int currentMemoryAddress = 0;
		public static int currentLine = 0;
		public const int reservedMemoryLength = 10;
		public static Dictionary<string, int> variables = new Dictionary<string, int>();

		// compiler options
		public static bool stripComments;
		public static bool commentCode;
		public static bool minify;
		public const string allowedChars = "<>+\\-\\[\\].,#";

		public static void Main(string[] args)
		{
			Generate();
		}

		public static void Generate()
		{
			string file = "test.cebf";
			List<string> lines = File.ReadAllLines(file).ToList();

			// Prepare lines: trim
			for (int i = 0; i < lines.Count; i++)
			{
				lines[i] = lines[i].Trim();
			}


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

			// reserve first 10 memory addresses for variables of the compiler
			bf += new string('>', reservedMemoryLength) + "  ;;; Reserve bf compiler memory space";

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

			for (currentLine = 0; currentLine < lines.Count; currentLine++)
			{
				if (lines[currentLine] == "") continue;
				List<string> cmds = lines[currentLine].Split(' ').ToList();
				string cmd = cmds[0];
				bf += "\n;;" + lines[currentLine] + "\n";
				int addressA;
				int addressB;
				int addressC;
				int value;
				switch (cmd)
				{
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
				bf += "\n";
			}

			// Compiler options:
			minify = lines.Any(x => x.ToLower().StartsWith("#minify"));

			string finalBF = "";
			string[] bfLines = bf.Split('\n');
			for (int i = 0; i < bfLines.Length; i++)
			{
				string finalLine = bfLines[i] + "\n";
				finalBF += finalLine;
			}

			if (minify)
			{
				finalBF = Regex.Replace(finalBF, "[^" + allowedChars + "]", "");
			}

			Console.WriteLine("Finished bf: \n\n" + finalBF);
			ClipboardService.SetText(finalBF);
		}

		/////////////////////// Helper methods

		/// <summary>
		/// EXPERIMENTAL!!! DO NOT ALTER MEMORY WITH THIS METHOD. YOU WILL MOST LIKELY FUCK YOUR MEMORY UP
		/// </summary>
		public static void IF(int address, string onTrue, string onFalse)
		{
			int startAddress = currentMemoryAddress + 0;
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
			EndMathOperation(addressA, addressB, endAddress);
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
}