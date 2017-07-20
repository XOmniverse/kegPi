require 'rpi_gpio'
require 'os'

RPi::GPIO.set_numbering :bcm

RPi::GPIO.setup PIN_NUM, as: :input, pull: :up
