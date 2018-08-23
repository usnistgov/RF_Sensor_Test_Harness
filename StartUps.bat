REM---------LabVIEW start--------
REM go to the ESC WaveformPlayer directory
echo off
dir /b /s *.lvproj*> plyr.txt
set /p Plyrvar= <plyr.txt
del plyr.txt
rem set PlstrPath= cd:
set c=%Plyrvar%
echo echo off > plyrLnch.bat
echo cd %c:~0,-27% >> plyrLnch.bat

REM startup LabVIEW player
echo start "" "ESC_Waveform_Player.lvproj" >>plyrLnch.bat

start plyrLnch.bat

REM---------LabVIEW end----------

REM---------Python start-------------

REM go to the Python server directory
echo off
dir   /b /s "*.py*" echo off> serv.txt

set /p PYvar= <serv.txt
del serv.txt
set c=%PYvar%
echo echo off> pyLnch.bat
echo cd %c:~0,-22%>> pyLnch.bat

REM startup the Python Server
echo start "" "ESC_TestHarness_WS.py" >>pyLnch.bat
start pyLnch.bat

REM-----------Python End-------


REM open a web browser
start "" "http://localhost:9001"

cd "C:\Users\chw1\Desktop\ESC_Test_Harness-masterLV2017\ESC_Test_Harness-master\ESC_Test_Harness-master\Test"

start "" "WaveformBatch.bat"

start "" "WaveformBatchForTDMS.bat"




