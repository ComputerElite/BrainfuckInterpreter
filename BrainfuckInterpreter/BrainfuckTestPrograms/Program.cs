string input;
string brainfuck = "";
string code = "";
while ((input = Console.ReadLine()) != "START")
{
    brainfuck += input;
}
foreach(char c in brainfuck)
{
    string current = "YU)GHRUPHGURHGUHRUGHRSUIGHISUROHGRSIOUHGIOSRUHGIORSUHGIOURSHGROISUHOIUHGIRSHGUOISHGUSOIGHSIOUHSOIUHGUISOHGOSIUHGRISOGHRUISOGHRISOGHRISOGHRSOGHSROUGHRUSOG";
    int n = (int)c;
    for(int i = 2; i < n; i++)
    {
        for (int a = 5; a < n; a++)
        {
            if(a * i == n)
            {
                current = current.Length < (new string('+', a) + "[>" + new string('+', i) + "<-]>").Length ? current : (new string('+', a) + "[>" + new string('+', i) + "<-]>");
                break;
            }
        }
    }
    for (int i = 1; i < n; i++)
    {
        for (int a = 1; a < n; a++)
        {
            for (int u = 1; u < n; u++)
            {
                if (a * i + u == n)
                {
                    current = current.Length < (new string('+', a) + "[>" + new string('+', i) + "<-]>" + new string('+', u)).Length ? current : (new string('+', a) + "[>" + new string('+', i) + "<-]>" + new string('+', u));
                }
            }
        }
    }
    code += current + ".[-]<";
}
Console.WriteLine(code);