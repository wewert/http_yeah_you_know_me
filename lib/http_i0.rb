require 'socket'
require 'pry'

#Starts server instance listening to port 9292
counter = 0

tcp_server = TCPServer.new(9292)
while client = tcp_server.accept
  counter += 1

  #Snippet to keep reading stream until input is a blank line. Stores all requests in "request_lines" array
  puts "Ready for a request"
  request_lines = []

  while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
  end

  #prints below to sceen for debugging
  puts "Got this request:"
  puts request_lines.inspect

  #Response to requests.
  puts "Sending response."
  response = "<pre>" + request_lines.join("\n") + "</pre>"
  output = "<html><head></head><body>Hello Asshole. Counting:#{counter} #{response}</body></html>"
  headers = ["http/1.1 200 ok",
            "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
            "server: ruby",
            "content-type: text/html; charset=iso-8859-1",
            "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  client.puts headers
  client.puts output

  #close up server
  puts ["Wrote this response:", headers, output].join("\n")
end
client.close
puts "\nResponse complete, exiting."
