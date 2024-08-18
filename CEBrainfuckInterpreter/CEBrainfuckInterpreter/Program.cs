using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

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
		private static Stream StandardOutput;
		private static Stream StandardInput;
		private static Stream ConsoleStandardOutput;
		private static Stream ConsoleStandardInput;
		private static Process? currentProcess = null;

		static void OutputsToConsole()
		{
			StandardInput = ConsoleStandardInput;
			StandardOutput = ConsoleStandardOutput;
		}
		
		static void OutputsToProcessIfRunning()
		{
			if (currentProcess == null || currentProcess.HasExited)
			{
				OutputsToConsole();
				return;
			}
			StandardInput = currentProcess.StandardOutput.BaseStream;
			StandardOutput = currentProcess.StandardInput.BaseStream;
		}

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
			ConsoleStandardOutput = Console.OpenStandardOutput();
			ConsoleStandardInput = Console.OpenStandardInput();
			OutputsToConsole();

			if (args.Length > 0) brainfuck = File.ReadAllText(args[0]);
			else
			{
				while ((input = Console.ReadLine()) != "START" && input != "DEBUG")
				{
					brainfuck += input;
				}
			}
			brainfuck = brainfuck.Replace("\t", "");
			//Console.Clear();

			string currentBashCommand = "";
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
						if (pointer < 0) {
							throw new Exception("Memory underflow. This is not supported");
						}
						break;
					case '>': // Increase pointer right
						pointer++;
						if (pointer >= memory.Length) {
							// ToDo: increase memory limit
							throw new Exception("Max memory location reached");
						}
						break;
					case '+': // Increase value
						memory[pointer]++;
						break;
					case '-': // Decrease value
						memory[pointer]--;
						break;
					case '.': // Write memory to console
						//Console.WriteLine("\n" + memory[0]);
						switch (memory[0])
						{
							case 0x0: // write to stdout (aka process if it's there
								StandardOutput.WriteByte(memory[pointer]);
								break;
							case 0x1: // append to bash command buffer
								currentBashCommand += (char)memory[pointer];
								break;
							case 0x2: // redirect stdout and stdin to bash command in currentBashCommand
								currentProcess = Process.Start(new ProcessStartInfo
								{
									FileName ="bash",
									ArgumentList = { "-c", currentBashCommand },
									RedirectStandardOutput = true,
									RedirectStandardInput = true,
									UseShellExecute = false
								});
								currentBashCommand = "";
								Console.WriteLine("\nStarted process " +currentBashCommand);
								OutputsToProcessIfRunning();
								memory[0] = 0x0;
								break;
							case 0x3: // close the current process and come back to the console
								if (currentProcess != null)
								{
									currentProcess.Kill();
									currentProcess = null;
								}
								OutputsToConsole();
								memory[0] = 0x0;
								break;
							case 0x4: // Output to console
								ConsoleStandardOutput.WriteByte(memory[pointer]);
								break;
						}
						// write to stdout
						
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
						switch(memory[0]) {
							default:
								int b = StandardInput.ReadByte();
								if(b == -1) OutputsToConsole(); // end of stream
								memory[1] = b == -1 ? (byte)0x1 : (byte)0x0;
								memory[pointer] = b != -1 ? (byte)b : (byte)0x0;
								break;
							case 0x3:
								memory[pointer] = (byte)(currentProcess == null || currentProcess.HasExited ? 0x0 : 0x1);
								break;
							case 0x4:
								int c = ConsoleStandardInput.ReadByte();
								memory[1] = c == -1 ? (byte)0x1 : (byte)0x0;
								memory[pointer] = c != -1 ? (byte)c : (byte)0x0;
								break;
						}
						break;
					case '#':
						Console.WriteLine(memory[0]);
						Console.WriteLine("Pointer at " + pointer + " with value " + memory[pointer]);
						break;
					
				}
				programPosition++;
			}
			//Console.WriteLine("Done");
			//Display();
			//Console.CursorTop += 2;
			//Console.WriteLine(programPosition);
			Console.WriteLine();
		}


	}
}