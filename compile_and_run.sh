# Check if first parameter is n or empty
if [ "$1" = "c" ] || [ -z "$1" ]; then
    cd CEBrainfuckCreator/CEBrainfuckCreator
    dotnet run ../../cebf_src/readline.cebf ../../cebf_src/out/compiled.bf
    cd ../..
else
    echo "Skipping compiling"
fi
cd CEBrainfuckInterpreter/CEBrainfuckInterpreter
dotnet build
cd ../..
echo
echo
echo
bash run.sh