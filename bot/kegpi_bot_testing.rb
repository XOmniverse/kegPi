require 'http'
require 'json'

rc = HTTP.post("https://slack.com/api/chat.postMessage", params: { 
	token: ENV['KEGPI_SLACK_TOKEN'],
	channel: '#general',
	text: 'This is an example KegPi alert'
})
puts JSON.pretty_generate(JSON.parse(rc.body))

