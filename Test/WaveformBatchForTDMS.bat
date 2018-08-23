
dir /b /s *1_*.tdms*> mytest1_tdms.txt
set /p myvar1_tdms= <mytest1_tdms.txt
set str1_tdms=,3600000000,1.55231294628997e-07,10
set v1_tdms=%myvar1_tdms%%str1_tdms% 
echo %v1_tdms% >> waveformsTDMS.txt
del mytest1_tdms.txt

dir /b /s *2_*.tdms*> mytest2_tdms.txt
set /p myvar2_tdms= <mytest2_tdms.txt 
set str2_tdms=,3600000000,9.64320154291225e-08,5
set v2_tdms=%myvar2_tdms%%str2_tdms% 
echo %v2_tdms% >> waveformsTDMS.txt
del mytest2_tdms.txt

dir /b /s *3_*.tdms*> mytest3_tdms.txt;
set /p myvar3_tdms= <mytest3_tdms.txt 
set str3_tdms=,3600000000,5.01504513540622e-07,5 
set v3_tdms=%myvar3_tdms%%str3_tdms% 
echo %v3_tdms% >> waveformsTDMS.txt
del mytest3_tdms.txt

dir /b /s *4_*.tdms*> mytest4_tdms.txt  
set /p myvar4_tdms= <mytest4_tdms.txt 
set str4_tdms=,3600000000,5.27426160337553e-07,5
set v4_tdms=%myvar4_tdms%%str4_tdms% 
echo %v4_tdms% >> waveformsTDMS.txt
del mytest4_tdms.txt
