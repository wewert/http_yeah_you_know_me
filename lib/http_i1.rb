

class RequestBack
  def request_response
    verb = request_lines[0].split[0]
          path = request_lines[0].split[1]
          protocol = request_lines[0].split[2]
          host = request_lines[1].split(":")[1].lstrip
          port = request_lines[1].split(":")[2]
          origin = host
          accept = request_lines[-3].split[1]
          diagnostics= %Q(
          <pre>
          Verb: #{verb}
          Path: #{path}
          Protocol: #{protocol}
          Host: #{host}
          Port: #{port}
          Origin: #{origin}
          Accept: #{accept}
          </pre>)
    output = "<html><head></head><body>Hey Jackass. Counting:#{counter} #{response} #{diagnostics}</body></html>"
  end
end
