require 'net/http'
require 'uri'

url = URI.parse('https://example.com')  # Replace with your desired URL
response = Net::HTTP.get_response(url)

puts response.body  # This will print the response body

uri = URI('https://hooks.slack.com/services/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')
headers = { 'Content-Type': 'application/json' }

body = { text: message_parsed }
res = Net::HTTP.post(uri, body.to_json, headers)