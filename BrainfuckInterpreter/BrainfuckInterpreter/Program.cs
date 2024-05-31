xusing System;
using System.Collections.Generic;

namespace BrainFuck
{
    public class BrainfuckInterpreter
    {
        static byte[] memory = new byte[0xFFFF];
        static int pointer = 0;
        static int programPosition = 0;
        static List<int> lastLoopOpen = new List<int>();
        static void Display(int length = 30)
        {

            for (int i = 0; i < length; i++)
            {
                if (Console.WindowWidth < (i + 1) * 4) Console.SetCursorPosition(0, Console.CursorTop + 1);
                Console.SetCursorPosition(i * 4, Console.CursorTop);
                Console.Write("|" + ((int)memory[i]).ToString().PadRight(3));
                Console.SetCursorPosition((i * 4 + 2) % Console.WindowWidth, Console.CursorTop + 1);
                if (i == pointer)
                {
                    Console.Write("/\\");
                }
                else
                {
                    Console.Write("  ");
                }
                Console.SetCursorPosition(i * 4, Console.CursorTop - 1);
            }
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
            if (args.Length > 0) brainfuck = File.ReadAllText(args[0]);
            else
            {
                while ((input = Console.ReadLine()) != "START" && input != "DEBUG")
                {
                    brainfuck += input;
                }
            }
            Console.Clear();
            Console.SetCursorPosition(0, 0);
            Console.WriteLine(brainfuck);
            Console.WriteLine("");
            Console.WriteLine("");
            while (programPosition < brainfuck.Length)
            {
                if (args.Length >= 2 && args[1] == "debug" || input == "DEBUG")
                {
                    Console.SetCursorPosition(0, 10);
                    Console.Write("Open loops: " + lastLoopOpen.Count + ", loop 0: " + (lastLoopOpen.Count >= 1 ? lastLoopOpen[0] : -2) + "\nPosition: " + programPosition);
                    Console.SetCursorPosition(0, 1);
                    Console.WriteLine(new String(' ', programPosition) + "^" + new String(' ', brainfuck.Length));
                    Display();
                    Console.ReadKey();
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
            //Console.WriteLine(programPosition);
        }

        
    }
}