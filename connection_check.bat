@echo off
set /a c=0
:Top
echo ------------------------------------------------------------------  
@echo off
if %c% == 40 goto END
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b)
echo %mydate% %mytime%
echo.
netstat -np TCP | find "32400" | find "ESTABLISHED"
PING 1.1.1.1 -n 1 -w 15000 >NUL
set /a c+=1
GOTO TOP
:END
echo ------------------------------------------------------------------  >> "G:\Plex_Data\output.txt"
echo[ >> "G:\Plex_Data\output.txt"
echo %mydate% %mytime% >> "G:\Plex_Data\output.txt"
netstat -np TCP | find "32400" | find "ESTABLISHED" >> "G:\Plex_Data\output.txt"
set /a c=0
GOTO TOP
@echo off 
