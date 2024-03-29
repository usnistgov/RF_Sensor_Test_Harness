REM---------LabVIEW start--------
dir /b /s *.lvproj*> plyr.txt
set /p Plyrvar= <plyr.txt
del plyr.txt
set c=%Plyrvar%
echo cd %c:~0,-25% > plyrLnch.bat
echo start "" "RF_Waveform_Player.lvproj" >>plyrLnch.bat
echo exit >>plyrLnch.bat
start plyrLnch.bat
REM---------LabVIEW end----------

REM---------Python start-------------
echo off
dir   /b /s "*.py*" echo off> serv.txt
set /p PYvar= <serv.txt
del serv.txt
set c=%PYvar%
echo echo off> pyLnch.bat
echo cd %c:~0,-27%>> pyLnch.bat
REM startup the Python Server
echo python "RF_Sensor_TestHarness_WS.py" >>pyLnch.bat
start pyLnch.bat
REM-----------Python End-------
timeout /T 1

REM open a web browser
start "" "http://localhost:9001"

timeout /T 2
del plyrLnch.bat
del pyLnch.bat

dir /b /s *.tmp*> wvfm.txt
set /p Wvfvar= <wvfm.txt
del wvfm.txt

set c=%Wvfvar%
echo cd %c:~0,-10% > wvformFileMkr.bat

REM launch WaveformBatchForTDMS
echo start "" "WaveformBatch.bat" >> wvformFileMkr.bat
echo exit >>wvformFileMkr.bat
start wvformFileMkr.bat

