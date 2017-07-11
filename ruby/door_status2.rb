require 'pi_piper'
include PiPiper

watch :pin => 5 do
		puts "Pin changed from closed to open"
end

PiPiper.wait
