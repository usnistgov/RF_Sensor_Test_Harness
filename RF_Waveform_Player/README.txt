RF Sensor Test Harness
Table of Contents
1. Legal Disclaimers
1.1. Software Disclaimer
1.2. Commercial Disclaimer
2. Project Summary
2.1. Current development
3. Setup
4. Usage
1. Legal Disclaimers
1.1. Software Disclaimer
NIST-developed software is provided by NIST as a public service. You may use, copy and distribute copies of the software in any medium, provided that you keep intact this entire notice. You may improve, modify and create derivative works of the software or any portion of the software, and you may copy and distribute such modifications or works. Modified works should carry a notice stating that you changed the software and should note the date and nature of any such change. Please explicitly acknowledge the National Institute of Standards and Technology as the source of the software.

NIST-developed software is expressly provided "AS IS." NIST MAKES NO WARRANTY OF ANY KIND, EXPRESS, IMPLIED, IN FACT OR ARISING BY OPERATION OF LAW, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT AND DATA ACCURACY. NIST NEITHER REPRESENTS NOR WARRANTS THAT THE OPERATION OF THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE, OR THAT ANY DEFECTS WILL BE CORRECTED. NIST DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OF THE SOFTWARE OR THE RESULTS THEREOF, INCLUDING BUT NOT LIMITED TO THE CORRECTNESS, ACCURACY, RELIABILITY, OR USEFULNESS OF THE SOFTWARE.

You are solely responsible for determining the appropriateness of using and distributing the software and you assume all risks associated with its use, including but not limited to the risks and costs of program errors, compliance with applicable laws, damage to or loss of data, programs or equipment, and the unavailability or interruption of operation. This software is not intended to be used in any situation where a failure could cause risk of injury or damage to property. The software developed by NIST employees is not subject to copyright protection within the United States.

See NIST Software Disclaimer for more details.

1.2. Commercial Disclaimer
Certain commercial equipment, instruments, or materials are identified in this paper to foster understanding. Such identification does not imply recommendation or endorsement by the National Institute of Standards and Technology, nor does it imply that the materials or equipment identified are necessarily the best available for the purpose.

2. Project Summary
This is the test setup for an RF Sensor.

2.1. Current development
LabVIEW 2017 (Player)
Python (Server)
Matlab (Post processing)
3.0 Setup
Detailed instructions can be downloaded at Instructions For Running RF Sensor Tester. Instructions for running the RF Sosnor Test Harness

The Test Harness includes:

Instructions for Running the RF Sensor Test Harness

Introduction
This document is a step by step set of instructions for downloading and operating the RF Sensor Test Harness.  It assumes the signal generator is controlled by LabVIEW virtual instruments.  The RF Sensor Test Harness consists of a Python web server, LabVIEW server (LabVIEW player) and a web browser.  The player accepts the waveforms via HTTP; converts the binary waveform files to TDMS (a LabVIEW specific file format) and plays the waveforms. 

Required Hardware
•	National Instruments PXIe-1085 (chassis)
•	National Instruments PXIe-8880 (controller)
•	National Instruments PXIe-5646 (VST)

Required Software
•	Windows 7 or higher
•	LabVIEW 2017

Note: Flask framework for Python is required.
Download the RF Sensor Test Harness-master
Copy the compressed file to a computer (PXIe-8880) hosting LabVIEW. 

3.1)	Starting the RF Sensor Tester (Python Server, LabVIEW player and web browser)
3.1a)	Locate and double click the “StartUp.bat” file located in the “RF Sensor Test Harness-master” folder.
•	The Python status window will appear. 
•	The LabVIEW player will appear. 
•	A web browser will be launched automatically.  
 
3.1b)	Start the LabVIEW player by right clicking on the “v1”.  Select “Start” to initiate the session.  A Debug web service window will appear.   Click “OK”.  
•	The RF Sensor Test Harness user interface (web browser) is already launched and will appear.   
•	Press “log in”.  The default user name and password are “admin” and “default”.
 
3.2)	Playing the waveforms
3.2a)	Locate the “waveforms.txt” file located in your “Test” folder.    
•	Enter the full path of the “waveform.txt” file into the “Input File Location” field of the user interface and press “Input_From_File” to play the waveforms. 

The initial run of the RF Sensor Test Harness will convert the included waveforms from binary (.dat) to .tdms format prior to playing the waveforms.  As a result, there will be a 60 second delay before the waveforms plays.  Once each of the waveforms are converted to .tdms, each waveform will play sequentially with no delay.  The new TDMS files will appear in the “Test” directory.   

The status of the waveform conversions and waveform playing can be monitored on the GlobalVriables.vi Front Panel.

3.2b)	Go to the LabVIEW project and expand the folder “99 – Others”.  Double click the “GlobalVariables.vi”.  The GlobalVariables.vi front panel will appear. 

 

Note: the waveforms can be viewed on your spectrum analyzer.    See optional step 5 for configuring your spectrum analyzer.

                                                                    
              
3.3)	Stopping the RF Sensor Tester (Python Server, LabVIEW player)
•	To stop the Python web server, select the running Python screen.   Select “Ctrl + C”
•	To stop the LabVIEW player right click on “v1”. Select “Stop”

3.4)	Customizing the waveform parameters (optional)
•	The waveform.txt file included in the download uses the following convention:
Path |waveform.dat, Center Frequency, Scale Factor, Waveform Gain  
•	The center frequency, scale factor and waveform gain located in the “WaveformBatch.bat” file will need to be changed accordingly and saved as a .bat file.
•	The updated batch file can create a new waveform.txt file by double clicking “WaveformBatch.bat”.
•	Repeat step 2a to play the updated waveforms.


3.5)	Configuring your spectrum analyzer (optional)
 The spectrum analyzer settings are controlled with Standard Commands for Programmable Instruments (SCPI) commands.  The address for the VISA connection will need to be changed.  
•	To change the VISA address, go to the LabVIEW Project Explorer, expand the Dependencies tab.  
•	Locate and open the "SpectrumAnn SCPI commands.vi".  
•	Enter the VISA address for your instrument.  
•	Expand the menu in the case structure to reveal the spectrum analyzer settings for the different waveforms. 

If manual configurations are preferred, the "local" key on the spectrum analyzer will end the remote session.
4. Usage
The spectrum analyzer settings used in the Test Harness are controlled with Standard Commands for Programmable Instruments (SCPI) commands. To alter these setting, use the windows explorer to search for the vi "SpectrumAnn SCPI commands.vi" and customize this sequence to your preference.

If you prefer to manually configure your spectrum analyzer select the "local" key on the instruments front pannel. This will end the remote control session.
