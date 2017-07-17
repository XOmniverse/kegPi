import os
import sys
import time
import math
import logging
import RPi.GPIO as GPIO
#from flowmeter import *

##initialize GPIO pins
#boardRevision = GPIO.RPI_REVISION
#GPIO.setmode(GPIO.BCM) # use real GPIO numbering
#GPIO.setup(22,GPIO.IN, pull_up_down=GPIO.PUD_UP)
#
# set up the flow meter
keg1Pin=22
keg2pin=27
pouring = False
lastPinState = False
pinState = 0
lastPinChange = int(time.time() * 1000)
pourStart = 0
pinChange = lastPinChange
pinDelta = 0
hertz = 0
flow = 0
litersPoured = 0
pintsPoured = 0
#
#def get_flow_value():
#    # main loop
#    while True:
#        currentTime = int(time.time() * 1000)
#        if GPIO.input(22):
#            pinState = True
#        else: 
#            pinState = False
#            
#    # handle pin states (e.g., change low to high)
#    if(pinState != lastPinState and pinState == True):
#        if(pouring == False):
#          pourStart = currentTime
#        pouring = True
#        #get current time
#        pinChange = currentTime
#        pinDelta = pinChange - lastPinChange
#        if(pinDelta < 1000):
#          #calculate speed
#          hertz = 1000.0000 / pinDelta
#          litersPoured += flow * ( pinDelta / 1000.0000 )
#          pintsPoured = litersPoured * 2.11338
#    
#    if (pouring == True and pinState == lastPinState and (currentTime - lastPinChange) > 3000):
#        # set pouring back to false, tweet the current amt poured, and reset everything
#        pouring = False
#        if (pintsPoured > 0.1):
#          pourTime = int((currentTime - pourStart)/1000) - 3
#          litersPoured = 0
#          pintsPoured = 0
#    return pintsPoured
#
#while True:
#    print(pintsPoured)
#    time.sleep(1)


GPIO.setmode(GPIO.BCM)
GPIO.setup(keg2pin, GPIO.IN, pull_up_down = GPIO.PUD_UP)

global count
count = 0

def countPulse(channel):
   global count
   count = count+1
   print count

GPIO.add_event_detect(keg2pin, GPIO.FALLING, callback=countPulse)

while True:
    try:
        time.sleep(1)
    except KeyboardInterrupt:
        print '\ncaught keyboard interrupt!, bye'
        GPIO.cleanup()
        sys.exit()
