# ESC Test Harness

## Table of Contents
- [1. Legal Disclaimers](#1-legal-disclaimers)
    - [1.1. Software Disclaimer](#11-software-disclaimer)
    - [1.2. Commercial Disclaimer](#12-commercial-disclaimer)
- [2. Project Summary](#2-project-summary)
    - [2.1. Current development](#21-current-development)
- [3. Setup](#3-setup)
- [4. Usage](#4-usage)


# 1. Legal Disclaimers
## 1.1. Software Disclaimer
 NIST-developed software is provided by NIST as a public service. 
 You may use, copy and distribute copies of the software in any medium,
 provided that you keep intact this entire notice. You may improve,
 modify and create derivative works of the software or any portion of
 the software, and you may copy and distribute such modifications or
 works. Modified works should carry a notice stating that you changed
 the software and should note the date and nature of any such change.
 Please explicitly acknowledge the National Institute of Standards and
 Technology as the source of the software.
 
 NIST-developed software is expressly provided "AS IS." NIST MAKES NO
 WARRANTY OF ANY KIND, EXPRESS, IMPLIED, IN FACT OR ARISING BY
 OPERATION OF LAW, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT
 AND DATA ACCURACY. NIST NEITHER REPRESENTS NOR WARRANTS THAT THE
 OPERATION OF THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE, OR
 THAT ANY DEFECTS WILL BE CORRECTED. NIST DOES NOT WARRANT OR MAKE ANY 
 REPRESENTATIONS REGARDING THE USE OF THE SOFTWARE OR THE RESULTS 
 THEREOF, INCLUDING BUT NOT LIMITED TO THE CORRECTNESS, ACCURACY,
 RELIABILITY, OR USEFULNESS OF THE SOFTWARE.
 
 You are solely responsible for determining the appropriateness of
 using and distributing the software and you assume all risks
 associated with its use, including but not limited to the risks and
 costs of program errors, compliance with applicable laws, damage to 
 or loss of data, programs or equipment, and the unavailability or
 interruption of operation. This software is not intended to be used in
 any situation where a failure could cause risk of injury or damage to
 property. The software developed by NIST employees is not subject to
 copyright protection within the United States.

 See [NIST Software Disclaimer](https://www.nist.gov/disclaimer) for more details.

## 1.2. Commercial Disclaimer
 Certain commercial equipment, instruments, or materials are identified in this paper to foster understanding. Such identification does not imply recommendation or endorsement by the National Institute of Standards and Technology, nor does it imply that the materials or equipment identified are necessarily the best available for the purpose.

# 2. Project Summary
This is the test setup for an Environmental Sensing Capability (ESC) sensor.

## 2.1. Current development 
* LabVIEW 2017 (Player)
* Python (Server)
* Matlab (Post processing)

# 3. Setup
  Detailed instructions can be downloaded at [Instructions For Running  ESC Tester](https://github.com/usnistgov/ESC_Test_Harness/blob/master/InstructionsForRunningESC_Tester.pdf).
  Instructions for running the ESC_Test_Harness

There are three parts to the Test Harness. 
1) Python server 
2) LabVIEW 2017 web server (Player)
3) Firefox web browser

A spectrum analyzer is required to view your waveform data.  

After a successful download and unzip of the package to a computer hosting LabVIEW 2017 and PXI;
navigate to the folder ESC_TestHarness_master
 
To start the ESC Tester 
1) Locate and double click the “StartUp.bat” file located in the  “ESC_Test_Harness-master” folder

2) Python window will appear

3) The ESC_Server will appear  

4) Start the ESC_Server by right clicking on the “v1”. Select “Start” to initiate the session.  You will see Debug Web service windows appears.  Click “OK”.  The ESC Test Harness interface will appear.  Press “log in”. The default user name and password are “admin” and “default”.  

5) Locate the “waveforms.txt” file located in your “Test” folder. Enter the full path of the “waveform.txt” file into the “Input File Location” and press “Input_From_File” to play the waveforms.

Note: the waveforms can be viewed on your spectrum analyzer.    See step 5 for configuring your spectrum analyzer.
  
# 4. Usage
  The spectrum analyzer settings used in the Test Harness are controlled with Standard Commands for Programmable Instruments (SCPI) commands.  To alter these setting, use the windows explorer to search for the vi "SpectrumAnn SCPI commands.vi" and customize this sequence to your preference.

If you prefer to manually configure your spectrum analyzer select the "local" key on the instruments front pannel.  This will end the remote control session.
