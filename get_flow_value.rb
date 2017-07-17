require 'rpi_gpio'
require 'os'

#Set up flow meters
KEG1PIN = 22
KEG2PIN = 27
POURING = false
LASTPINSTATE = false
PINSTATE = 0
POURSTART = 0
PINCHANGE = LASTPINCHANGE
PINDELTA = 0
HERTZ = 0
FLOW = 0
LITERSPOURED = 0
PINTSPOURED = 0

#Setting board numbering & adding pull up resistor options for pins
RPi::GPIO.set_numbering :bcm
RPi::GPIO.setup KEG1PIN, :as => :input, :pull => :up
RPi::GPIO.setup KEG2PIN, :as => :input, :pull => :up

$count = 0

def count_pulse(channel)
  $count += 1
  puts($count)
end

RPi::GPIO.add_event_detect(KEG2PIN, GPIO.FALLING, callback=count_pulse)
