# Check if first parameter is n or empty
if [ "$1" = "c" ] || [ -z "$1" ]; then
    cd CEBrainfuckCreator/CEBrainfuckCreator
    dotnet run
    cd ../..
else
    echo "Skipping compiling"
fi
cd CEBrainfuckInterpreter/CEBrainfuckInterpreter
dotnet build
echo running
cd ../..
dotnet CEBrainfuckInterpreter/CEBrainfuckInterpreter/bin/Debug/net6.0/CEBrainfuckInterpreter.dll CEBrainfuckCreator/CEBrainfuckCreator/compiled.bf