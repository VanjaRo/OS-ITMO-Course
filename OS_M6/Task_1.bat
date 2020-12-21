::1.1
mkdir "C:\LAB6"
wmic os get caption, version > "C:\LAB6\version.txt"
wmic wmic computersystem get totalphysicalmemory > "C:\LAB6\memory.txt"
wmic os get freephysicalmemory >> "C:\LAB6\memory.txt"
wmic logicaldisk list brief > "C:\LAB6\disks.txt"

::1.2
mkdir "C:\LAB6\TEST"
xcopy "C:\LAB6\*" 
"C:\LAB6\TEST\"

::1.3
copy "C:\LAB6\TEST\*" "C:\LAB6\TEST\all.txt"

::1.4
for /f "skip=1" %%i in ('dir TEST /b/a:-d/o:-d/t:c') do ( 
    del TEST\%%i
)