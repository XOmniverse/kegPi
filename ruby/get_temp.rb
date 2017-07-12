require 'os'
require 'rpi_gpio'

system("modprobe w1-gpio")
system("modprobe w1-therm")

#basedir = "/sys/bus/w1/devices/"
#device_folder = Dir.glob(basedir + "28*")[0]
#device_file = device_folder + "/w1_slave"

def read_temp_raw()
  basedir = "/sys/bus/w1/devices/" 
  device_folder = Dir.glob(basedir + "28*")[0]
  device_file = device_folder + "/w1_slave"
  f = open(device_file, 'r')
  lines = f.read()
  f.close()
  #return lines
end

def read_temp()
  lines = read_temp_raw()
  while lines[0].strip()[-3:] != "YES" do
	sleep 0.2
	lines = read_temp_raw
  end
  equals_pos = lines[1].find("t=")
  if equals_pos != -1 do
	temp_string = lines[1][equals_pos+2:]
	temp_c = temp_string.to_f / 1000.0
	temp_f = temp_c * 9.0 / 5.0 + 32.0
	return temp_f
  end
end

while true do
  p("Current Temp: " + read_temp().to_s + " Fahrenheit")
  sleep 1.0
end

