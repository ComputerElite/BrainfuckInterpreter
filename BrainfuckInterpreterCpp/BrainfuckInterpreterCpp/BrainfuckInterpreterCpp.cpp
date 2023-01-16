#include <iostream>
#include <string>
#include <list>
using namespace std;

unsigned char memory[0xFFFF] = {};
int pointer = 0;
int programPosition = 0;
list<int> lastLoopOpen;

/*
int GetArrayLength(int arr[]) {
    int length = 0;
    for (int i = 0; i < sizeof(arr); i++) {
        if (arr[i] <= 0) {
            //if (length <= 0) length = 0;
            return length;
        }
        length++;
    }
    return length;
}
*/

int main()
{
    string brainfuck = ",[.,]";
    bool debug = true;
    int amount = 0;
    while (programPosition < brainfuck.length())
    {
        amount++;

        if (lastLoopOpen.size() >= 1 && lastLoopOpen.front() == -1 && brainfuck[programPosition] != ']' && brainfuck[programPosition] != '[')
        {
            //cout << "skipping";
            programPosition++;
            continue;
        }

        switch (brainfuck[programPosition])
        {
            case '<': // Decrease pointer
                pointer--;
                if (pointer < 0) pointer = sizeof(memory) - 1;
                break;
            case '>': // Increase pointer right
                pointer++;
                if (pointer >= sizeof(memory)) pointer = 0;
                break;
            case '+': // Increase value
                memory[pointer]++;
                break;
            case '-': // Decrease value
                memory[pointer]--;
                break;
            case '.': // Write memory to console
                cout << memory[pointer];
                break;
            case '[': // Open loop
                lastLoopOpen.push_front(memory[pointer] == 0 || lastLoopOpen.size() >= 1 && lastLoopOpen.front() == -1 ? -1 : programPosition);
                break;
            case ']': // Close loop
                if (memory[pointer] == 0)
                {
                    lastLoopOpen.pop_front();
                    break;
                }
                programPosition = lastLoopOpen.front();
                lastLoopOpen.pop_front();
                continue;
            case ',': // Set the memory to the inputted key
                cin >> memory[pointer];
                break;
        }
        programPosition++;
    }
    //cout << amount
}