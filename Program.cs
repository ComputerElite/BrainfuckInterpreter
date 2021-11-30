using System;

class Program
{
    static byte[] memory = new byte[0xFFFF];
    static int pointer = 0;
    static int programPosition = 0;
    static int lastLoopOpen = 0;
    static void Main(string[] args)
    {
        string brainfuck = "";
        string input;
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
            while ((input = Console.ReadLine()) != "")
            {
                brainfuck += input;
            }
        }
        Console.WriteLine("");
        Console.WriteLine("");
        while (programPosition < brainfuck.Length)
        {
            if (lastLoopOpen == -1)
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
                    lastLoopOpen = programPosition;
                    if (memory[pointer] == 0) lastLoopOpen = -1;
                    break;
                case ']':
                    if (memory[pointer] != 0)
                    {
                        programPosition = lastLoopOpen;
                        continue;
                    }
                    lastLoopOpen = 0;
                    break;
                case ',': // Set the memory to the inputted key
                    memory[pointer] = (byte)Console.ReadKey(true).KeyChar;
                    break;
                default:
                    // Don't do anything in case there are any comments or line breaks
                    break;

            }
            programPosition++;
        }
        Console.WriteLine("");
        Console.WriteLine("");
        Console.WriteLine("");
    }
}