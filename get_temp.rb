require 'os'
require 'rpi_gpio'

system("modprobe w1-gpio")
system("modprobe w1-therm")

BASEDIR = "/sys/bus/w1/devices/"
DEVICE_FOLDER = Dir.glob(BASEDIR + "28*")[0]
DEVICE_FILE = DEVICE_FOLDER + "/w1_slave"

def read_temp_raw()
  f = open(DEVICE_FILE, 'r')
  lines = f.readlines()
  f.close()
  return lines
end

def read_temp()
  lines = read_temp_raw()
  while lines[0][-4..-2] != "YES" do
	sleep 0.2
	lines = read_temp_raw
  end
  equals_pos = lines[1].index("t=")
  if equals_pos != -1 then
		  temp_string = lines[1][equals_pos+2..-1].chomp
	temp_c = temp_string.to_f / 1000.0
	temp_f = temp_c * 9.0 / 5.0 + 32.0
	return temp_f
  end
end

while true do
  puts("Current Temp: " + read_temp().to_s + " Fahrenheit")
  sleep 1.0
end
