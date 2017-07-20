# KegPi
## Making My Kegerator Just a Bit Smarter
---

The KegPi is my effor to accomplish 2 things:
1. Learn to code
2. Add some features to my garden-variety kegerator that will make it that much better

What are those features, you may ask?
* Temperature monitoring
* Door monitoring
* Beer monitoring

Right, those all seem well and good, but what exactly do they boil down to? For me, I wanted to know what the temperature inside the kegerator is, whether or not I've left the door open, and how much beer do I have left. 

## Technical Info
---

### Hardware
The following is a list of all the components that are present in the KegPi right now:
* [Whirlpool 4.3 cu ft mini fridge](https://www.amazon.com/Whirlpool-Stainless-Compact-Refrigerator-Fridge/dp/B00XQLQXMY)
* [Chrome plated dual faucet tower](http://www.beveragefactory.com/draftbeer/towers/doublefaucet/D4743DT___6843.shtml)
* [Draft Brewer Flex Keg System](https://www.midwestsupplies.com/draft-brewer-flex-keg-system)
* [Aluminum CO2 Tank - 5 lb](http://www.austinhomebrew.com/Aluminum-CO2-Tank--5-lb_p_4693.html)
* [Surface Mount Drip Tray](http://www.beveragefactory.com/draftbeer/driptray/cutout/kegco-surface-mount-drip-tray-seco1610.html)
* [Raspberry Pi 3](https://www.amazon.com/Raspberry-Model-A1-2GHz-64-bit-quad-core/dp/B01CD5VC92/ref=sr_1_3?s=pc&ie=UTF8&qid=1500307132&sr=1-3&keywords=raspberry+pi+3)
* [Smarticase for Raspberry Pi 3](https://smarticase.com/collections/all/products/smartipi-touch)
* [Smarticase Back Cover (large)](https://smarticase.com/collections/all/products/smartipi-touch-back-cover)
* [Touchscreen for Raspberry Pi](https://www.adafruit.com/product/2718)
* [Liquid Flow Meters (2x)](https://www.adafruit.com/product/2718)
* [Magnetic Contact Sensor](https://www.adafruit.com/product/375)
* [Waterproof DS18B20 Digital temperature sensor](https://www.adafruit.com/product/381)

### Software
This part of the project is a bit more of a WIP. While the underlying scripts are more or less written, there are some key features that will be implemented in the coming weeks/months:
- [ ] Dashboard displaying current statistics about the kegerator/kegs (e.g., temperature, door status, volume left in kegs)
- [ ] SMS alerting for temperature and door status
- [ ] Slack integration to allow for alerts in Slack channel

Again, the goal here is for this to be a learning experience for me in writing code (Ruby, in this case) and also for me to share the project and enable other folks to create the same thing.

#### Running the scripts
As they currently stand, the Ruby bits are just some starting scripts. As the project evolves, they're going to get folded into something a bit more complex. But, you're welcome to run them as they are to see how they work. Simply do:

    ruby name_of_script.rb

That will get you the values of the door, as well as the temperature for the time being. Flow values are still being toyed with until I can get stuff addressed there.  

#### More info about 'rpi_gpio'
[The rpi_gpio gem](https://github.com/ClockVapor/rpi_gpio) is a Ruby implementation of the Python [RPi.GPIO module](https://pypi.python.org/pypi/RPi.GPIO). ClockVapor has great examples on the rpo for the Ruby gem, and you can find any additional info you may need over on the Python module site. 
