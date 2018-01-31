from flask import Flask, request, render_template, flash, session, url_for, redirect
import json, StringIO, time, datetime, os, shutil, errno, signal, atexit, pycurl
from os import listdir
from os.path import isfile, join
from optparse import OptionParser

app = Flask(__name__)
app.config.from_envvar('FLASKR_SETTINGS', silent=True)

@app.route('/', methods=['POST'])
def main():
  #   JSON-Formatted http message from ESC Sensor
  if 'jsonrpc' in request.data:
      objs = json.loads(request.data)  
      DUMPS = { 
                "jsonrpc": objs["jsonrpc"], 
                "Test_File": objs["Test_File"],
                "RF_Center_Freq": objs["Center_Freq"] 
               }
      print "\nReceived:\n", json.dumps(DUMPS, sort_keys = False, indent = 4, separators=(',', ': ')) , "\n"
      buf = StringIO.StringIO()
      time.sleep(10)
      objs['Done'] = "TRUE"
      objs["Status"] = "OK"
      LV_Response = json.dumps(objs)
      c = pycurl.Curl()
      c.setopt(c.HTTPHEADER, ['Accept: application/json, text/html', 'Content-Type: application/json,text/html', 'Acept-Charset: UTF-8'])
      # c.setopt(c.POSTFIELDS, array())
      c.setopt(c.CONNECTTIMEOUT, 5)
      c.setopt(c.TIMEOUT, 8)
      c.setopt(c.FAILONERROR, True)
      c.setopt(c.URL, 'http://127.0.0.1:9001') #Adjust it to what LabVIEW is expecting
      # send all data to this function
      c.setopt(c.WRITEFUNCTION, buf.write)
      # some servers don't like requests that are made without a user-agent
      # field, so we provide one
      c.setopt(c.USERAGENT, 'libcurl-agent/1.0')
      c.setopt(c.POSTFIELDS, LV_Response)
      # if we don't provide POSTFIELDSIZE, libcurl will strlen() by itself
      c.setopt(c.POSTFIELDSIZE, len(LV_Response))
      c.setopt(c.VERBOSE, 1)  # c.setopt(c.DEBUGFUNCTION, test)
      c.perform()
      print c.getinfo(pycurl.HTTP_CODE) , c.getinfo(pycurl.EFFECTIVE_URL)
      c.close()
      print "\nSending", json.dumps(objs, sort_keys = False, indent = 4, separators=(',', ': '))
      return (json.dumps(objs, sort_keys = False, indent = 4, separators=(',', ': ')))

if __name__ == '__main__':
	  try:
             print 'Simulating LabVIEW client response !'
      	     app.run(threaded=True, host='127.0.0.1', port=5000)
   	  except OSError as exc: 
	      print "Error Running WSDB webServer"