
dir /b /s *1_*.dat*> mytest1.txt
set /p myvar1= <mytest1.txt
REM the format of str1 is comma delimited "Center frequency" , "Read Scale" , "Waveform Gain"
REM To customize a different waveform please use the convention in this batch file
set str1=,3600000000,5.3361792956243332E-8,10
set v1=%myvar1%%str1% 
echo %v1% > waveforms.txt
echo > blank.tmp
del mytest1.txt

dir /b /s *2_*.dat*>> mytest2.txt
set /p myvar2= <mytest2.txt 
REM the format of str2 is comma delimited "Center frequency" , "Read Scale" , "Waveform Gain"
REM To customize a different waveform please use the convention in this batch file
set str2=,3600000000,5.5370985603543743E-8,5
set v2=%myvar2%%str2% 
echo %v2% >> waveforms.txt
del mytest2.txt

dir /b /s *3_*.dat*>> mytest3.txt;
set /p myvar3= <mytest3.txt 
REM the format of str3 is comma delimited "Center frequency" , "Read Scale" , "Waveform Gain"
REM To customize a different waveform please use the convention in this batch file
set str3=,3600000000,4.4622936189201248E-8,5 
set v3=%myvar3%%str3% 
echo %v3% >> waveforms.txt
del mytest3.txt

dir /b /s *4_*.dat*>> mytest4.txt  
set /p myvar4= <mytest4.txt 
REM the format of str4 is comma delimited "Center frequency" , "Read Scale" , "Waveform Gain"
REM To customize a different waveform please use the convention in this batch file
set str4=,3600000000,9.1240875912408763E-8,5
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




