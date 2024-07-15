cd CEBrainfuckCreator/CEBrainfuckCreator
dotnet run
cd ../..
cd CEBrainfuckInterpreter/CEBrainfuckInterpreter
dotnet build
echo running
cd ../..
dotnet CEBrainfuckInterpreter/CEBrainfuckInterpreter/bin/Debug/net6.0/CEBrainfuckInterpreter.dll CEBrainfuckCreator/CEBrainfuckCreator/compiled.bf