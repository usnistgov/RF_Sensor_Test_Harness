# RF Sensor Test Harness
# Table of Contents
# 1. Legal Disclaimers
# 1.1. Software Disclaimer
# 1.2. Commercial Disclaimer
# 2. Project Summary
# 2.1. Current development
# 3. Setup
# 4. Usage
# 1. Legal Disclaimers
# 1.1. Software Disclaimer
# NIST-developed software is provided by NIST as a public service. You may
# use, copy and distribute copies of the software in any medium, provided that
# you keep intact this entire notice. You may improve, modify and create
# derivative works of the software or any portion of the software, and you
# may copy and distribute such modifications or works. Modified works should
# carry a notice stating that you changed the software and should note the
# date and nature of any such change. Please explicitly acknowledge the
# National Institute of Standards and Technology as the source of the software.
#
# NIST-developed software is expressly provided "AS IS." NIST MAKES NO WARRANTY
# OF ANY KIND, EXPRESS, IMPLIED, IN FACT OR ARISING BY OPERATION OF LAW,
# INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT AND DATA ACCURACY. NIST
# NEITHER REPRESENTS NOR WARRANTS THAT THE OPERATION OF THE SOFTWARE WILL BE
# UNINTERRUPTED OR ERROR-FREE, OR THAT ANY DEFECTS WILL BE CORRECTED. NIST DOES
# NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OF THE SOFTWARE OR
# THE RESULTS THEREOF, INCLUDING BUT NOT LIMITED TO THE CORRECTNESS, ACCURACY,
# RELIABILITY, OR USEFULNESS OF THE SOFTWARE.
#
# You are solely responsible for determining the appropriateness of using and
# distributing the software and you assume all risks associated with its use,
# including but not limited to the risks and costs of program errors,
# compliance with applicable laws, damage to or loss of data, programs or
# equipment, and the unavailability or interruption of operation. This software
# is not intended to be used in any situation where a failure could cause risk
# of injury or damage to property. The software developed by NIST employees
# is not subject to copyright protection within the United States.
#
# See NIST Software Disclaimer for more details.
#
# 1.2. Commercial Disclaimer
# Certain commercial equipment, instruments, or materials are identified in
# this paper to foster understanding. Such identification does not imply
# recommendation or endorsement by the National Institute of Standards and
# Technology, nor does it imply that the materials or equipment identified
# are necessarily the best available for the purpose.
#
# 2.0 Project Summary
# This is the test setup for an RF Sensor Test Harness.
#
# 2.1. Current development
# LabVIEW 2017 (Player)
# Python (Server)
# Matlab (Post processing)
# 3.0 Setup
# Detailed instructions can be downloaded at Instructions For Running the
# RF_Sensor_Test_Harness.
# Instructions for running the RF Sensor Test Harness
#
# The RF Sensor Test Harness includes:
#
# National Instruments PXIe-1085 (chassis)
# National Instruments PXIe-8880 (controller)
# National Instruments PXIe-5646 (VST)
# Python server
# LabVIEW 2017 web server (Player)
# Note: Flask framework for Python is required.
#

# Download the RF Sensor Test Harness master.
# Copy the compressed file to a computer (PXIe-8880) hosting LabVIEW.
#
# 3.1 Starting the RF Sensor Test Harness (Python Server, LabVIEW player and
# web browser)
# 3.1a Locate and double click the StartUp.bat file located in the RF Sensor
# Test Harness master folder.
#
# The Python status window will appear.
# The LabVIEW player will appear.
# A web browser will be launched automatically.
# 3.1b	Start the LabVIEW player by right clicking on the v1. Select Start
# to initiate the session. A Debug web service window will appear. Click OK.
#
# The RF Sensor Test Harness user interface (web browser) is already launched
# and will appear.
# Press log in. The default user name and password are admin and default.
# 3.2	Playing the waveforms
# 3.2a	Locate the waveforms.txt file located in your Test folder.
#
# Enter the full path of the waveform.txt file into the
# Input File Location field of the user interface and press
# Input_From_File to play the waveforms.
# The initial run of the RF Sensor Test Harness will convert the included
# waveforms from binary (.dat) to .tdms format prior to playing the waveforms.
# As a result, there will be a 60 second delay before the waveforms plays.
# Once each of the waveforms are converted to .tdms, each waveform will
# play sequentially with no delay. The new TDMS files will appear in
# the Test directory.
#
# The status of the waveform conversions and waveform playing can be monitored
# on the GlobalVriables.vi Front Panel.
#
# 3.2b	Go to the LabVIEW project and expand the folder (99 Others). Double
# click the GlobalVariables.vi. The GlobalVariables.vi front panel will
# appear.
#
# Note: the waveforms can be viewed on your spectrum analyzer.
# See optional step 5
# for configuring your spectrum analyzer.
#
# 3.3	Stopping the RF Sensor Test Harness (Python Server, LabVIEW player)
# 	To stop the Python web server, select the running Python screen.
# Select Ctrl + C.
# 	To stop the LabVIEW player right click on v1. Select Stop.
#
# 3.4	Customizing the waveform parameters (optional)
# 	The waveform.txt file included in the download uses the following
# convention: Path |waveform.dat, Center Frequency, Scale Factor, Waveform Gain
# 	The center frequency, scale factor and waveform gain located in
# the WaveformBatch.bat file will need to be changed accordingly and saved
# as a .bat file.
# 	The updated batch file can create a new waveform.txt file by double
# clicking WaveformBatch.bat.
# 	Repeat step 2a to play the updated waveforms.
#
# 3.5	Configuring your spectrum analyzer (optional)
# The spectrum analyzer settings are controlled with Standard Commands for
# Programmable Instruments (SCPI) commands. The address for the VISA connection
# will need to be changed.
# 	To change the VISA address, go to the LabVIEW Project Explorer, expand
# the Dependencies tab.
# 	Locate and open the SpectrumAnn SCPI commands.vi.
# 	Enter the VISA address for your instrument.
# 	Expand the menu in the case structure to reveal the spectrum analyzer
# settings for the different waveforms.
#
# If manual configurations are preferred, the local key on the spectrum
# analyzer will end the remote session.
#
# 4. Usage
# The spectrum analyzer settings used in the Test Harness are controlled with
# Standard Commands for Programmable Instruments (SCPI) commands. To alter
# these setting, use the windows explorer to search for the vi
# SpectrumAnn SCPI commands.vi and customize this sequence to your
# preference.
#
# If you prefer to manually configure your spectrum analyzer select the local
# key on the instruments front pannel. This will end the remote control
# session.
# Read me END.
import sys
from flask import Flask
from flask import request
from flask import render_template
from flask import flash
from flask import session
from flask import url_for
from flask import redirect
import json
import random
import StringIO
import time
import datetime
import os
import shutil
import errno
import signal
import atexit
import pycurl
from os import listdir
from os.path import isfile
from os.path import join
from optparse import OptionParser
import logging
import logging.handlers
import requests
import csv

app = Flask(__name__)

T_Start = dict()
T_End = dict()
Statuses = dict()
Test_Dir_Files = ''
RF_Center_Freq = ''
RF_Gain = ''
Random_RF_Center_Freq = False

# Load default config and override config from an environment variable
app.config.update(dict(
    DEBUG=True,
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))

app.config.from_envvar('FLASKR_SETTINGS', silent=True)


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != app.config['USERNAME']:
            error = 'Invalid username'
        elif request.form['password'] != app.config['PASSWORD']:
            error = 'Invalid password'
        else:
            session['logged_in'] = True
            flash('You were logged in')
            return redirect(url_for('main'))
    return render_template('login.html', error=error)


@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    flash('You were logged out')
    return render_template('main.html')


@app.route('/')
def Initialize():
    return render_template('main.html')


@app.route('/', methods=['GET', 'POST'])
def main():

    global Input_File
    global Test_Dir
    global Test_Dir_Files
    global RF_Gain
    global BB_Gain
    global RF_Center_Freq
    global Random_RF_Center_Freq
    global T_Begin
    global T_End
    global Statuses
    global file_max
    global file_index

    print ("\nDEBUG: Begin \n")
    if request.data != "":
        print ("\nDEBUG: non-null data \n")
        try:
            print ("\nDEBUG: enter try \n")
            JSON_Request_Data = json.loads(request.data)
            print ("\nReceived", json.dumps(JSON_Request_Data, sort_keys=False,
                                            indent=4, separators=(',', ': ')))
            # JSON message from LabVIEW Player
            received = JSON_Request_Data['Test_File']
            if (JSON_Request_Data['Status'] == "Done"):
                    print ("\nDONE, playing ", received)
                    if received in T_Start.keys():
                        print ("\n received is in T_Start.keys() \n")
                        T_End[received] = time.time()

                        if (JSON_Request_Data["Error"] == ""):
                                print ("\n No error in JSON_Request_Data \n")
                                Statuses[received] = "0"
                                app.logger.info('LV Status: %s', "0")
                        else:
                                print ("\n ERROR in JSON_Request_Data "" \n")
                                Statuses[received] = JSON_Request_Data['Error']
                                app.logger.info('LV Status: %s',
                                                Statuses[received])
                        app.logger.info('LV Response: Test_File: %s,',
                                        received)
                        app.logger.info('Start_T: %d ', T_Start[received])
                        app.logger.info('End_T: %d \n', T_End[received])

                    else:
                        print ("Error in \"Test_File\" ")
                        print ("argument caught from LabVIEW response")
            # JSON message from RF Sensor
            elif ('RF_Sensor' in request.data):
                print ("\nGot Notification from RF Sensor\n")
                app.logger.info('Notification received from RF Sensor')
                objs = json.loads(request.data)
                devDesc = objs["params"]["deviceDesc"]
                DUMPS = {
                    "jsonrpc": objs["jsonrpc"],
                    "id":  objs["id"],
                    "result": {
                            "kind": "RFtestHarnessGetSensorParams",
                                    "type": objs["params"]["type"],
                            "version": objs["params"]["version"],
                                    "timestamp": time.time(),
                            "deviceDesc": {
                                "serialNumber": devDesc["serialNumber"],
                                "fccId": devDesc["fccId"],
                                "fccRFDeviceType": devDesc["fccRFDeviceType"]
                                    }, "status": {"OK"}
                                }
                    }
                print ("\nResponding RF: \n", json.dumps(DUMPS, indent=4, separators=(',', ': ')), "\n")
                return (json.dumps(DUMPS, sort_keys=True, indent=4, separators=(',', ': ')))
            else:
                print ("\nUnknown JSON request: it is neither an RF notification nor a LV response nor a user form entry !\n\n")
        except:
            print ("Caught Exception\n")

    else:
        # Form entries
        if (request.form['Test_Dir'] != ''):
            Test_Dir = request.form['Test_Dir']
            print ("Test_Dir: ", Test_Dir)
            Test_Dir_Files = [f for f in listdir(Test_Dir) if isfile(join(Test_Dir, f))]
            print ("Test directory files: ", Test_Dir_Files)
        else:
            print ("Choose a directory containing Test Files First")
            if (request.form['RF_Gain'] != ''):
                RF_Gain = request.form['RF_Gain']
                print ("RF Gain: ", RF_Gain)
            else:
                print ("Enter a value for RF Gain")

        if (request.form['BB_Gain'] != ''):
            BB_Gain = request.form['BB_Gain']
            print ("Baseband Gain: ", BB_Gain)
        else:
            print ("Enter a value for BB_Gain")

        print ("request.form['RF_Center_Freq_Type']", request.form['RF_Center_Freq_Type'])
        if (request.form['RF_Center_Freq_Type']) == "Specific":
            RF_Center_Freq = request.form['RF_Center_Freq']
            print ("RF_Center_Freq: ", RF_Center_Freq)
        elif (request.form['RF_Center_Freq_Type']) == "Random":
            print ("Choosing RF Center Frequency Randomly")
            Random_RF_Center_Freq = True
        else:
            print ("Please check a type of RF Center Frequency: Specific or Random")

        # Input_File = request.form['Input_File']

    return render_template('main.html')


@app.route('/Input_From_File', methods=['GET', 'POST'])
def Input_From_File():

    global Input_File
    # app.logger.info('EXECUTING TESTS FROM FILE')
    # sanity check
    if (request.form['Input_File'] != ''):
        Input_File = request.form['Input_File']
        if not (os.path.isfile(Input_File)):
            print ("Incorrect File Path !")
    else:
        print ("Enter a value for the Input_File !")
    with open(Input_File, 'r') as My_Input_File:
        reader = csv.reader(My_Input_File, delimiter=',')
        My_List = list(reader)
        print ("My_List: ", My_List)
        file_max = len(My_List)

    My_Input_File = open(Input_File, 'r')
    # file_max = sum(1 for line in My_Input_File)
    i = 1

    for line in My_Input_File:
        print ("\n########### TESTING FILE", i, "###########\n")
        buf = StringIO.StringIO()
        data = {}
        tests = line.strip().split("\n")
        data['Test_File'] = ''.join([item.split(',')[0] for item in tests if item])
        data['RF_Center_Freq'] = ''.join([item.split(',')[1] for item in tests if item])
        data['BB_Gain'] = ''.join([item.split(',')[2] for item in tests if item])
        data['RF_Gain'] = ''.join([item.split(',')[3] for item in tests if item])
        data['file_index'] = ''.join([str(i)])
        data['file_max'] = ''.join([str(file_max)])
        print(" File path [", i, "]: ", data['Test_File'])
        print(" Center Frequency [", i, "]: ", data['RF_Center_Freq'])
        print(" BaseBand Gain [", i, "]: ", data['BB_Gain'])
        print(" RF_Gain [", i, "]: ", data['RF_Gain'])
        print(" file_index [", i, "]: ", i)
        print(" file_max [", i, "]: ", file_max)

        instruct_LV = json.dumps(data)
        c = pycurl.Curl()
        c.setopt(c.HTTPHEADER, ['Accept: application/json', 'Content-Type: application/json', 'charsets: utf-8'])
        c.setopt(c.URL, 'http://' + LV + ':8001/v1/Main_System')
        # send all data to this function
        c.setopt(c.WRITEFUNCTION, buf.write)
        # some servers don't like requests that are made without a user-agent field, so we provide one
        c.setopt(c.USERAGENT, 'libcurl-agent/1.0')
        c.setopt(c.POSTFIELDS, instruct_LV)
        # if we don't provide POSTFIELDSIZE, libcurl will strlen() by itself
        c.setopt(c.POSTFIELDSIZE, len(instruct_LV))
        c.setopt(c.VERBOSE, 1)  # c.setopt(c.DEBUGFUNCTION, test)
        print('\n')
        print (app.logger.info('Instruction sent: TEST FILE: %s, %s, %s', data["Test_File"], data['RF_Center_Freq'], data['RF_Gain']))
        print('\n')
        T_Start[data['Test_File']] = time.time()
        c.perform()
        print (c.getinfo(pycurl.HTTP_CODE), c.getinfo(pycurl.EFFECTIVE_URL))
        c.close()
        body = buf.getvalue()
        buf.close()
        i += 1
    print("completed current test\n\n")
    return render_template('main.html')


@app.route('/Execute_Tests', methods=['GET', 'POST'])
def Execute_Tests():

    global Test_Dir
    global Test_Dir_Files
    global RF_Center_Freq
    global RF_Gain
    global BB_Gain
    global Random_RF_Center_Freq
    global T_Start
    global T_End
    global Statuses
    global file_max
    global file_index

    # app.logger.info('EXECUTING TESTS FROM WEB INTERFACE')

    if Test_Dir == "":
        print ("Empty Test Directory !")

    for item in Test_Dir_Files:
        buf = StringIO.StringIO()
        data = {}
        data['RF_Gain'] = RF_Gain
        data['BB_Gain'] = BB_Gain
        # data['file_index'] = file_index
        # data['file_max'] = file_max

        data['Test_File'] = Test_Dir+"\\"+item
        if Random_RF_Center_Freq:
            data['RF_Center_Freq'] = str(Radar_RF_Center_Freqs(random.randint(1, 15)))
        else:
            data['RF_Center_Freq'] = RF_Center_Freq
        instruct_LV = json.dumps(data)

        c = pycurl.Curl()
        c.setopt(c.HTTPHEADER, ['Accept: application/json', 'Content-Type: application/json', 'charsets: utf-8'])
        # c.setopt(c.URL, 'http://' + LV + ':8001/v1/RF_Harness_InstructionsListener')  # no idea what this is
        # c.setopt(c.URL, 'http://' + LV + ':8001/v1/Main_System')  # seems to be functional
        c.setopt(c.URL, 'http://' + LV + ':5000')  # doesn't seem to work
        # send all data to this function
        c.setopt(c.WRITEFUNCTION, buf.write)
        # some servers don't like requests that are made without a user-agent field, so we provide one
        c.setopt(c.USERAGENT, 'libcurl-agent/1.0')
        c.setopt(c.POSTFIELDS, instruct_LV)
        # if we don't provide POSTFIELDSIZE, libcurl will strlen() by itself
        c.setopt(c.POSTFIELDSIZE, len(instruct_LV))
        c.setopt(c.VERBOSE, 1)  # c.setopt(c.DEBUGFUNCTION, test)
        print('\n')
        print (app.logger.info('Instruction sent: TEST FILE: %s, %s, %s', data["Test_File"], data['RF_Center_Freq'], data['RF_Gain']))
        print('\n')
        T_Start[data['Test_File']] = time.time()
        c.perform()
        print (c.getinfo(pycurl.HTTP_CODE), c.getinfo(pycurl.EFFECTIVE_URL))
        c.close()
        body = buf.getvalue()
        print (data)
        buf.close()

    return render_template('main.html')


def Radar_RF_Center_Freqs(channel):
    Channels = {1: 3550,
                2: 3560,
                3: 3570,
                4: 3580,
                5: 3590,
                6: 3600,
                7: 3610,
                8: 3620,
                9: 3630,
                10: 3640,
                11: 3650,
                12: 3660,
                13: 3670,
                14: 3680,
                15: 3690}
    return Channels[int(channel)]*1000000  # convert from MHz to Hz


if __name__ == '__main__':

    global LV, fh

    T_Start = dict()
    T_End = dict()
    Statuses = dict()
    Test_Dir_Files = ''
    RF_Center_Freq = ''
    Random_RF_Center_Freq = False

    # os.rename(".", "")
    fh = logging.handlers.RotatingFileHandler(r'.\logs\RF-Test_'+datetime.datetime.now().strftime("%Y%m%d-%H%M%S")+".log", maxBytes=10000000, backupCount=5)
    fh.setLevel(logging.DEBUG)
    app.logger.addHandler(fh)
    fh.setFormatter(logging.Formatter('%(asctime)s %(levelname)s: %(message)s '))
    parser = OptionParser(usage="%prog: [options]")
    parser.add_option("-p", "--port", type="int", default=9001)
    parser.add_option("-s", "--ssl", action="store_true", default=False, help="Use of SSL Encryption")
    parser.add_option("-l", "--lv", help="LabView Server address, [default=%default]", default="127.0.0.1")
    (options, args) = parser.parse_args()

    LV = options.lv
    if not options.ssl:
        print ("Running without SSL Encryption")
        app.run(threaded=True, host='0.0.0.0', port=options.port)
    else:
        if (os.path.isfile('../keys/rsa.key') or os.path.isfile('../keys/rsa.crt')):
            try:
                print ("Running with SSL Encryption")
                from OpenSSL import SSL
                context = SSL.Context(SSL.SSLv23_METHOD)
                context.use_privatekey_file('../keys/rsa.key')
                context.use_certificate_file('../keys/rsa.crt')
                app.run(threaded=True, host='0.0.0.0', port=options.port, ssl_context=context)
            except OSError as exc:
                print ("Error Running WSDB webServer")
        else:
            print ("Authentication key needed in ../keys/")
