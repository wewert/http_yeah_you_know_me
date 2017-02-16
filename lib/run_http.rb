require './lib/http_i0'
require './lib/http_i1'

tcp_server = TCPServer.new(9292)
#formatter = RequestFormatting.new

request_counter = 0
hello_counter = 0

loop do
  while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
    puts "Got this request:"
    puts request_lines.inspect
    request_lines = hello_server.client_request
    #path = formatter.request_path(request_lines)
    #path_checker = PathChecker.new(path)

  unless request_lines.first == "GET /favicon.ico HTTP/1.1"
    request_counter += 1
    hello_counter += 1 if path_checker.hello?
  end

  response = Responser.new.generate_response(request_lines, hello_counter, request_counter)
  hello_server.server_response(response)

  if path_checker.start_game? && formatter.verb(request_lines) == "POST"
    game = Game.new(hello_server)
    game.run
  end

  break if path_checker.shutdown?
end
end
hello_server.close_server
