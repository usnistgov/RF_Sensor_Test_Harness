
REM The format of str1, str2, str3, str4 are comma delimited
REM To customize the waveform to a different center frequency,read scale or waveform gain
REM use the convention in this batch file

dir /b /s *1_*.dat*> mytest1.txt
set /p myvar1= <mytest1.txt


REM Center frequency = 3600000000 
REM Read Scale = 1.55231294628997e-07 
REM Waveform Gain = 10
set str1=,3600000000,1.55231294628997e-07,10
set v1=%myvar1%%str1% 
echo %v1% > waveforms.txt
echo > blank.tmp
del mytest1.txt

dir /b /s *2_*.dat*>> mytest2.txt
set /p myvar2= <mytest2.txt 
REM Center frequency = 3600000000 
REM Read Scale = 9.64320154291225e-08 
REM Waveform Gain = 5
set str2=,3600000000,9.64320154291225e-08,5
set v2=%myvar2%%str2% 
echo %v2% >> waveforms.txt
del mytest2.txt

dir /b /s *3_*.dat*>> mytest3.txt;
set /p myvar3= <mytest3.txt 
REM Center frequency = 3600000000 
REM Read Scale = 5.01504513540622e-07 
REM Waveform Gain = 5
set str3=,3600000000,5.01504513540622e-07,5 
set v3=%myvar3%%str3% 
echo %v3% >> waveforms.txt
del mytest3.txt

dir /b /s *4_*.dat*>> mytest4.txt  
set /p myvar4= <mytest4.txt 
REM Center frequency = 3600000000 
REM Read Scale = 5.27426160337553e-07 
REM Waveform Gain = 5
set str4=,3600000000,5.27426160337553e-07,5
set v4=%myvar4%%str4% 
echo %v4% >> waveforms.txt
del mytest4.txt

echo off
dir /b /s *.tmp*> dwvfm.txt
set /p Wvfvar= <dwvfm.txt
del dwvfm.txt

set c=%Wvfvar%
echo %c:~0,-10% > cln.bat
echo cd.. >> cln.bat
echo del wvformFileMkr.bat >> cln.bat
echo taskkill /IM cmd.exe >> cln.bat
start cln.bat




