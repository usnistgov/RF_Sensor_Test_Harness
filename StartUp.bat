REM---------LabVIEW start--------
REM go to the ESC WaveformPlayer directory
echo off
dir /b /s *.lvproj*> plyr.txt
set /p Plyrvar= <plyr.txt
del plyr.txt
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


echo off
dir /b /s *.tmp*> wvfm.txt
set /p Wvfvar= <wvfm.txt
del wvfm.txt

set c=%Wvfvar%

echo cd %c:~0,-10% > wvformFileMkr.bat

REM launch WaveformBatchForTDMS

echo start "" "WaveformBatch.bat" >> wvformFileMkr.bat
start wvformFileMkr.bat


del plyrLnch.bat
del pyLnch.bat




