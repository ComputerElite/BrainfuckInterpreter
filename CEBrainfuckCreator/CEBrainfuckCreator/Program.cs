using Microsoft.VisualBasic;
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
// 0: 
// 1: 
// 2: 
// 3: 
// 4: 
// 5: copy tmp

// reserve first 10 memory addresses for variables of the compiler
bf += new string('>', reservedMemoryLength) + "  ;;; Reserve bf compiler memory space";

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
		case "stc":
			addressA = GetAddress(cmds[2]);
			GoToMemoryAddress(addressA);
			
			value = HandleReservedValue(cmds[1][0]);
			SetCurrentAddressValue(value);
			break;
		case "stn":
			addressA = GetAddress(cmds[2]);
			GoToMemoryAddress(addressA);

			value = GetAddress(cmds[1]);
			SetCurrentAddressValue(value);
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
	}
}

int HandleReservedValue(int value)
{
	if (value == '^') return ' ';
	return value;
}
	 
int GetAddress(string address)
{
	return Convert.ToInt32(address);
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
	int tmpAAddress = GetBFCompilerMemoryAddress(0);
	int tmpBAddress = GetBFCompilerMemoryAddress(1);
	int tmpEndAddress = GetBFCompilerMemoryAddress(2);

	Copy(addressA, tmpAAddress);
	Copy(addressB, tmpBAddress);
	GoToMemoryAddress(tmpAAddress);

	bf += "[>[->+>+<<]>>[-<<+>>]<<<-]";

	Copy(tmpEndAddress, endAddress);
	ResetAddressValue(tmpAAddress);
	ResetAddressValue(tmpBAddress);
	ResetAddressValue(tmpEndAddress);
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


Console.WriteLine("Finished bf: \n\n" + bf);
ClipboardService.SetText(bf);