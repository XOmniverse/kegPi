require 'os'
require 'rpi_gpio'

system('modprobe w1-gpio')
system('modprobe w1-therm')

BASEDIR = '/sys/bus/w1/devices/'.freeze
DEVICE_FOLDER = Dir.glob(BASEDIR + '28*')[0]
DEVICE_FILE = DEVICE_FOLDER + '/w1_slave'

# Removed unnessary function read_temp_raw
# Entire function is expressed with File.read(DEVICE_FILE)

def read_temp
  lines = File.read(DEVICE_FILE)

  while lines[0][-4..-2] != 'YES'
    sleep 0.2
    lines = File.read(DEVICE_FILE)
  end

  equals_pos = lines[1].index('t=')

  # http://www.rubydoc.info/github/bbatsov/rubocop/Rubocop/Cop/Style/GuardClause
  return if equals_pos == -1

  # Removed extraneous lines
  # Pointless to define a temp_f variable simply to return that variable
  temp_c = lines[1][equals_pos + 2..-1].chomp.to_f / 1000.0
  temp_c * 9.0 / 5.0 + 32.0 # Return temperature in F instead of C
end

# http://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Style/InfiniteLoop
loop do
  puts('Current Temp: ' + read_temp.to_s + ' Fahrenheit')
  sleep 1.0
end
