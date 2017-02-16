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
  verb = request_lines[0].split[0]
  path = request_lines[0].split[1]
  protocol = request_lines[0].split[2]
  host = request_lines[1].split(":")[1].lstrip
  port = request_lines[1].split(":")[2]
  origin = host
  accept = request_lines[-3].split[1]

#binding.pry
  diagnostics = <<END_OF_DIAGNOSTICS
<pre>
  Verb: #{verb}
  Path: #{path}
  Protocol: #{protocol}
  Host: #{host}
  Port: #{port}
  Origin: #{origin}
  Accept: #{accept}
</pre>
END_OF_DIAGNOSTICS

  output = "<html><head></head><body>Hello Asshole. Counting:#{counter} #{response} #{diagnostics}</body></html>"
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



#class HttpI0
#Starts server instance listening to port 9292
#   def self.start
#     tcp_server = TCPServer.new(9292)
#     @client = tcp_server.accept
#   end
#
#   def requests
#     pputs "Ready for a request"
#     @request_lines = []
#     while line = @client.gets and !line.chomp.empty?
#       @request_lines << line.chomp
#       puts "Got this request:"
#       puts request_lines.inspect
#     end
#     @request_lines
#   end
#
#   def server_response(response)
#     output = "<html><head></head><body>#{response}</body></html>"
#     headers = ["http/1.1 200 ok",
#               "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
#               "server: ruby",
#               "content-type: text/html; charset=iso-8859-1",
#               "content-length: #{output.length}\r\n\r\n"].join("\r\n")
#     @client.puts headers
#     @client.puts output
#     puts ["Wrote this response:", headers, output].join("\n")
#   end
#
#   def close_server
#     @client.close
#     puts "\nResponse complete, exiting."
#   end
# end
  # counter = 0
  # tcp_server = TCPServer.new(9292)
  # while client = tcp_server.accept
  #   counter += 1
  #   puts "Ready for a request"
  #   request_lines = []
  #   while line = client.gets and !line.chomp.empty?
  #     request_lines << line.chomp
  #     puts "Got this request:"
  #     puts request_lines.inspect
  #     #Response to requests.
  #     puts "Sending response."
  #     response = "<pre>" + request_lines.join("\n") + "</pre>"
  #     verb = request_lines[0].split[0]
  #     path = request_lines[0].split[1]
  #     protocol = request_lines[0].split[2]
  #     host = request_lines[1].split(":")[1].lstrip
  #     port = request_lines[1].split(":")[2]
  #     origin = host
  #     accept = request_lines[-3].split[1]
  #     diagnostics= %Q(
  #     <pre>
  #     Verb: #{verb}
  #     Path: #{path}
  #     Protocol: #{protocol}
  #     Host: #{host}
  #     Port: #{port}
  #     Origin: #{origin}
  #     Accept: #{accept}
  #     </pre>)
  #     output = "<html><head></head><body>Hey Jackass. Counting:#{counter} #{response} #{diagnostics}</body></html>"
  #     headers = ["http/1.1 200 ok",
  #       "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
  #       "server: ruby",
  #       "content-type: text/html; charset=iso-8859-1",
  #       "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  #       client.puts headers
  #       client.puts output
  #
  #       #close up server
  #       puts ["Wrote this response:", headers, output].join("\n")
  #     end
  #     client.close
  #     puts "\nResponse complete, exiting."
  #   end
  #end
      #Snippet to keep reading stream until input is a blank line. Stores all requests in "request_lines" array

      #prints below to sceen for debugging

    #binding.pry

    # case path
    # when "/"
    #   response = diagnostics
    # when "/hello"
    #   response = diagnostics
    # when "/datetime"
    #   response = diagnostics
    # when "/shutdown"
    #   response = diagnostics
    # end
    #binding.pry
