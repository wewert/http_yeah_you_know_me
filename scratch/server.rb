require 'socket'
# Service Object
class Server
  attr_reader :tcp_listener

  def initialize
    @counter = 0
    @tcp_listener = TCPServer.new(9292)
  end

  # callback pattern 
  def start(&block)
    callback = block
    while client = @tcp_listener.accept
      request_lines = []
      @counter += 1
      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
        callback.call(request_lines)
        parse_request(reqquest_lines)
      end
    end
  end

  def get_request_details(lines)

  end

  private

  def parse_request(req_lines)
    verb, content_type, accepts, agent, host = req_lines
    # DO COOL SHIT HERE...
  end
end


# COntract

my_server = Server.new()

my_server.start do |x|
  puts x
  # what is x here?
end
