
dir /b /s *1_*.dat*> mytest1.txt
set /p myvar1= <mytest1.txt
set str1=,3600000000,1.55231294628997e-07,10
set v1=%myvar1%%str1% 
echo %v1% > waveforms.txt
echo > blank.tmp
del mytest1.txt

dir /b /s *2_*.dat*>> mytest2.txt
set /p myvar2= <mytest2.txt 
set str2=,3600000000,9.64320154291225e-08,5
set v2=%myvar2%%str2% 
echo %v2% >> waveforms.txt
del mytest2.txt

dir /b /s *3_*.dat*>> mytest3.txt;
set /p myvar3= <mytest3.txt 
set str3=,3600000000,5.01504513540622e-07,5 
set v3=%myvar3%%str3% 
echo %v3% >> waveforms.txt
del mytest3.txt

dir /b /s *4_*.dat*>> mytest4.txt  
set /p myvar4= <mytest4.txt 
set str4=,3600000000,5.27426160337553e-07,5
set v4=%myvar4%%str4% 
echo %v4% >> waveforms.txt
del mytest4.txt

