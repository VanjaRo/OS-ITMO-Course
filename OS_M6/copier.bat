net share NetTemp=%~dp0temp
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097152 copy @path \\%computername%\NetResource /Z"