using System;
using System.Collections.Generic;

namespace CEBrainFuck
{
	public class CEBrainfuckInterpreter
	{
		static byte[] memory = new byte[0xFFFF];
		static int pointer = 0;
		static int programPosition = 0;
		static List<int> lastLoopOpen = new List<int>();
		static void Display(int length = 30)
		{
			int memStart = pointer - (length / 2);
			if (memStart < 0) memStart = 0;
			for (int i = 0; i < length; i++)
			{
				if (Console.WindowWidth < (i + 1) * 4) Console.SetCursorPosition(0, Console.CursorTop + 1);
				Console.SetCursorPosition(i * 4, Console.CursorTop);
				int memAddr = memStart + i;
				Console.Write("|");
				if(memAddr == 20) {
					Console.ForegroundColor = ConsoleColor.Red;
				} else if(memAddr > 20 && memAddr % 2 == 0) {
					Console.ForegroundColor = ConsoleColor.DarkYellow;
				} else {
					Console.ForegroundColor = ConsoleColor.White;
				}
				Console.Write(((int)memory[memAddr]).ToString().PadRight(3));
				Console.SetCursorPosition((i * 4 + 2) % Console.WindowWidth, Console.CursorTop + 1);
				if (i + memStart == pointer)
				{
					Console.Write("/\\");
				}
				else
				{
					Console.Write("  ");
				}
				Console.SetCursorPosition((i * 4 + 1) % Console.WindowWidth, Console.CursorTop + 1);
				Console.Write(memAddr.ToString());
				Console.ForegroundColor = ConsoleColor.White;
				Console.SetCursorPosition(i * 4, Console.CursorTop - 2);
			}
		}

static char[] validBf = new char[] {'+', '-', '.', ',', '<', '>', '[', ']'};

		static void Main(string[] args)
		{
			string brainfuck = "";
			string input = "";
			/*
            // ASCII cheat sheet
            Thread.Sleep(2000);
            for(int i = 0; i < 256; i++)
            {
                Console.SetCursorPosition((int)Math.Floor((double)i / (double)Console.WindowHeight) * 14, i % Console.WindowHeight);
                Console.Write(i + "   " + (char)i);
            }
            */
			if (args.Length > 0) brainfuck = File.ReadAllText(args[0]);
			else
			{
				while ((input = Console.ReadLine()) != "START" && input != "DEBUG")
				{
					brainfuck += input;
				}
			}
			brainfuck = brainfuck.Replace("\t", "");
			Console.Clear();
			Console.SetCursorPosition(0, 0);
			Console.WriteLine(brainfuck);
			Console.WriteLine("");
			Console.WriteLine("");
			while (programPosition < brainfuck.Length)
			{
				if (args.Length >= 2 && args[1] == "debug" || input == "DEBUG")
				{
					Console.Clear();
					Console.SetCursorPosition(0, 10);
					Console.Write("Open loops: " + lastLoopOpen.Count + ", loop 0: " + (lastLoopOpen.Count >= 1 ? lastLoopOpen[0] : -2) + "\nPosition: " + programPosition);
					Console.SetCursorPosition(0, 1);   

					int startPos = programPosition - 60;
					if (startPos < 0) startPos = 0;
					int endPos = startPos + 120;
					if (endPos > brainfuck.Length) endPos = brainfuck.Length;

					string shownProgram = brainfuck.Substring(startPos, endPos - startPos);
					Console.SetCursorPosition(0, 0);
					Console.WriteLine(shownProgram);

					Console.WriteLine(new String(' ', programPosition - startPos) + "^");
					Display();
					if(validBf.Contains(brainfuck[programPosition])) Console.ReadKey();
				}

				if (lastLoopOpen.Count >= 1 && lastLoopOpen[0] == -1 && brainfuck[programPosition] != ']' && brainfuck[programPosition] != '[')
				{
					programPosition++;
					continue;
				}

				switch (brainfuck[programPosition])
				{
					case '<': // Decrease pointer
						pointer--;
						if (pointer < 0) pointer = memory.Length - 1;
						break;
					case '>': // Increase pointer right
						pointer++;
						if (pointer >= memory.Length) pointer = 0;
						break;
					case '+': // Increase value
						memory[pointer]++;
						break;
					case '-': // Decrease value
						memory[pointer]--;
						break;
					case '.': // Write memory to console
						Console.Write((char)memory[pointer]);
						break;
					case '[': // Open loop
						lastLoopOpen.Insert(0, memory[pointer] == 0 || lastLoopOpen.Count >= 1 && lastLoopOpen[0] == -1 ? -1 : programPosition);
						break;
					case ']': // Close loop
						if (memory[pointer] == 0)
						{
							lastLoopOpen.RemoveAt(0);
							break;
						}
						programPosition = lastLoopOpen[0];
						lastLoopOpen.RemoveAt(0);
						continue;
					case ',': // Set the memory to the inputted key
						memory[pointer] = (byte)Console.ReadKey(true).KeyChar;
						break;

				}
				programPosition++;
			}
			Console.WriteLine("");
			Console.WriteLine("");
			Display();
			Console.CursorTop += 2;
			//Console.WriteLine(programPosition);
		}


	}
}