# CEBF Interpreter
A Brainfuck Interpreter with extra functionality

## Extras
The interpreter uses addresses 0 and 1 for extra features.
This interpreter can run commands via bash -c and thus redirect standard in and out.
You can run multiple processes at once and switch between them.

## Memory #0
|cell value| stdout (`.`)                                      |stdin (`,`)|
|-|---------------------------------------------------|-|
|0 (default)| Writes to process (or console if none is running) |Reads from started process (or console if none is running)|
|1| Appends to the command buffer                     |Default|
|2| Runs command buffer content via `bash -c`         |Default|
|3| Kills the running process (if any)                |Default|
|4| Writes to console                                 |Reads from console|
|5| Select the process slot                           |Default|

## Memory #1
Generally for feedback on reads

|Cell value|Description|
|-|-|
|0(default)|Reading suceeded|
|1|End of console/process reached|
