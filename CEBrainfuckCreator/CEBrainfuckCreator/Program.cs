using Microsoft.VisualBasic;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using System.Transactions;
using TextCopy;

string file = "test.cebf";
string[] lines = File.ReadAllLines(file);

// Prepare lines: trim
for (int i = 0; i < lines.Length; i++)
{
	lines[i] = lines[i].Trim();
}

string bf = "";
int currentMemoryAddress = 0;
int currentLine = 0;
int[] memory = new int[0xFFFF];
const int reservedMemoryLength = 10;

// Reserved memory addresses
// 0: math a
// 1: math b
// 2: math result
// 3: 
// 4: 
// 5: copy tmp

// reserve first 10 memory addresses for variables of the compiler
bf += new string('>', reservedMemoryLength) + "  ;;; Reserve bf compiler memory space";

Dictionary<string, int> variables = new Dictionary<string, int>();

for (currentLine = 0; currentLine < lines.Length; currentLine++)
{
	string[] cmds = lines[currentLine].Split(' ');
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
			if(variables.ContainsKey(name)) variables.Add(name, addressA);
			variables[name] = addressA;
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
			// output value at address
			addressA = GetAddress(cmds[1]);
			GoToMemoryAddress(addressA);
			bf += ",";
			break;
		case "oum":
			// output value at address
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
			// output value at address
			addressA = GetAddress(cmds[1]);
			GoToMemoryAddress(addressA);
			bf += "[.>]";
			break;


		case "and":
			// output value at address
			addressA = GetAddress(cmds[1]);
			addressB = GetAddress(cmds[2]);
			addressC = GetAddress(cmds[3]);
			ANDGate(addressA, addressB, addressC);
			break;
		case "oor":
			// output value at address
			addressA = GetAddress(cmds[1]);
			addressB = GetAddress(cmds[2]);
			addressC = GetAddress(cmds[3]);
			ORGate(addressA, addressB, addressC);
			break;
		case "mov":
			// output value at address
			addressA = GetAddress(cmds[1]);
			GoToMemoryAddress(addressA);
			break;
	}
}

// Compiler options:
bool stripComments = lines.Any(x => x.ToLower().StartsWith("#nocomment"));
bool minify = lines.Any(x => x.ToLower().StartsWith("#minify"));

string finalBF = "";
string[] bfLines = bf.Split('\n');
for (int i = 0; i < bfLines.Length; i++)
{
	string finalLine = bfLines[i] + "\n";
	if (stripComments && finalLine.StartsWith(";")) continue;
	finalBF += finalLine;
}

string allowedChars = "<>+\\-\\[\\].,#";

if(minify)
{
	finalBF = Regex.Replace(finalBF, "[^" + allowedChars + "]", "");
}

Console.WriteLine("Finished bf: \n\n" + finalBF);
ClipboardService.SetText(finalBF);





/////////////////////// Helper methods

void ANDGate(int addressA, int addressB, int addressC)
{

	StartMathOperation(addressA, addressB, addressC);
	bf += "[->+<]++[->-<]>>[-]+<[>-<[-]]<";
	EndMathOperation(addressA, addressB, addressC);
}

void ORGate(int addressA, int addressB, int addressC)
{
	StartMathOperation(addressA, addressB, addressC);
	bf += "[->+<]>>[-]<[>+<[-]]<";
	EndMathOperation(addressA, addressB, addressC);
}

void StartMathOperation(int addressA, int addressB, int addressC)
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

void EndMathOperation(int addressA, int addressB, int addressC)
{
	int tmpAAddress = GetBFCompilerMemoryAddress(0);
	int tmpBAddress = GetBFCompilerMemoryAddress(1);
	int tmpCAddress = GetBFCompilerMemoryAddress(2);
	Copy(tmpCAddress, addressC);
	GoToMemoryAddress(addressC);
	ResetAddressValue(tmpAAddress);
	ResetAddressValue(tmpBAddress);
	ResetAddressValue(tmpCAddress);
}

int HandleReservedValue(int value)
{
	if (value == '^') return ' ';
	return value;
}

int ConvertToInt(string number)
{
	return Convert.ToInt32(number);
}
	 
int GetAddress(string address)
{
	if(address.StartsWith("$"))
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

void SetAddressValue(int address, int value)
{
	GoToMemoryAddress(address);
	SetCurrentAddressValue(value);
}

void ResetAddressValue(int address)
{
	GoToMemoryAddress(address);
	bf += "[-]";
}

void SetCurrentAddressValue(int value)
{
	int oldValue = memory[reservedMemoryLength + currentMemoryAddress] + 0;
	memory[reservedMemoryLength + currentMemoryAddress] = value;
	// set value;
	char sign = oldValue > value ? '-' : '+';
	bf += new string(sign, Math.Abs(oldValue - value));
}
string GetAddressMove(int diff)
{
	// set value;
	char sign = diff > 0 ? '<' : '>';
	return new string(sign, Math.Abs(diff));
}

void Copy(int addressA, int addressB)
{
	int tmpAddress = GetBFCompilerMemoryAddress(5);
	ResetAddressValue(tmpAddress);
	MoveValue(addressA, tmpAddress);
	GoToMemoryAddress(tmpAddress);
	bf += "[-" + GetAddressMove(tmpAddress - addressA) + "+" + GetAddressMove(addressA - addressB) + "+" + GetAddressMove(addressB - tmpAddress) + "]";
	GoToMemoryAddress(tmpAddress);
}

void MoveValue(int addressA, int addressB)
{
	GoToMemoryAddress(addressA);
	
	bf += "[-" + GetAddressMove(addressA - addressB) + "+" + GetAddressMove(addressB - addressA) + "]";
}

void MultiplyAddresses(int addressA, int addressB, int endAddress)
{
	EndMathOperation(addressA, addressB, endAddress);
	bf += "[>[->+>+<<]>>[-<<+>>]<<<-]";
	EndMathOperation(addressA, addressB, endAddress);
}

void AddAddresses(int addressA, int addressB, int endAddress)
{
	int tmpAAddress = GetBFCompilerMemoryAddress(0);
	int tmpBAddress = GetBFCompilerMemoryAddress(1);

	Copy(addressA, tmpAAddress);
	Copy(addressB, tmpBAddress);
	GoToMemoryAddress(tmpAAddress);

	bf += "[->+<]";

	Copy(tmpBAddress, endAddress);
	ResetAddressValue(tmpAAddress);
	ResetAddressValue(tmpBAddress);
}

void SubstractAddresses(int addressA, int addressB, int endAddress)
{
	int tmpAAddress = GetBFCompilerMemoryAddress(0);
	int tmpBAddress = GetBFCompilerMemoryAddress(1);

	Copy(addressA, tmpAAddress);
	Copy(addressB, tmpBAddress);
	GoToMemoryAddress(tmpAAddress);

	bf += "[->-<]";

	Copy(tmpBAddress, endAddress);
	ResetAddressValue(tmpAAddress);
	ResetAddressValue(tmpBAddress);
}

int GetBFCompilerMemoryAddress(int address)
{
	return -reservedMemoryLength + address;
}

void GoToMemoryAddress(int address)
{
	bf += GetAddressMove(currentMemoryAddress - address);
	currentMemoryAddress = address;
}