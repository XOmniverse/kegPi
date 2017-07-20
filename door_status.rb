require 'rpi_gpio'

RPi::GPIO.set_numbering :bcm

PIN_NUM = 5

RPi::GPIO.setup PIN_NUM, as: :input, pull: :up

loop do
  if RPi::GPIO.high? PIN_NUM
    puts('Kegerator door is open! Close it!')
  else
    puts('Kegerator door is closed.')
  end

  sleep 2.0
end
