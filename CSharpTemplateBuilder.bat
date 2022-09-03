@echo "Please input the full directory you want to create your projects in."

@echo off

set /p UserDirectory=

@echo "Solution Name?"

@echo off

set /p SolutionName=

:ask
@echo "Will your project name be the same as your solution name? (Y/N)"

@echo off

set /p UserAnswer=

If /I "%UserAnswer%" EQU "y" ( goto yes )
If /I "%UserAnswer%" EQU "n" ( goto no )
echo "Invalid input" & goto ask
:yes
set ProjectName=%SolutionName%
goto cont

:no
echo "Project Name?"
set /p ProjectName=

:cont
pause

cd %UserDirectory%

dotnet new sln -o %SolutionName%


cd %UserDirectory%/%SolutionName%

dotnet new gitignore

dotnet new console -o %ProjectName%"ConsoleUI"


dotnet new classlib -o %ProjectName%"Library"


dotnet new xunit -o %ProjectName%".Tests"


dotnet sln add %ProjectName%"ConsoleUI"


dotnet sln add %ProjectName%"Library"


dotnet sln add %ProjectName%".Tests"


cd "%UserDirectory%/%SolutionName%/%ProjectName%ConsoleUI"

dotnet add reference "%UserDirectory%/%SolutionName%/%ProjectName%Library"

cd "%UserDirectory%/%SolutionName%/%ProjectName%.Tests"

dotnet add reference "%UserDirectory%/%SolutionName%/%ProjectName%Library"

dotnet add reference "%UserDirectory%/%SolutionName%/%ProjectName%ConsoleUI"