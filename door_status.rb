require 'rpi_gpio'

RPi::GPIO.set_numbering :bcm

PIN_NUM = 5

RPi::GPIO.setup PIN_NUM, :as => :input, :pull => :up	
while true do
  if RPi::GPIO.high? PIN_NUM
    puts("Kegerator door is open! Close it!")
    sleep 2.0
  else
    puts("Kegerator door is closed.")
    sleep 2.0
  end
end
