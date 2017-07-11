require 'rpi_gpio'

RPi::GPIO.set_numbering :bcm

PIN_NUM = 5
RPi::GPIO.setup PIN_NUM, :as => :input


door_status = RPi::GPIO.setup PIN_NUM, :as => :input, :pull => :up


while door_status == true do
	print("Kegerator door is Open! Close it!")
end
