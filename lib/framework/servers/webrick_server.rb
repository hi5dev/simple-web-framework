module Framework
  class WEBrickServer < Framework::AbstractServer
    def log(message, level=:info)
      http_server.logger.public_send(level, message)
    end

    private

    def start_server
      http_server.start
    end

    def stop_server
      http_server.stop

      @http_server = nil
    end

    def http_server
      @http_server ||= WEBrick::HTTPServer.new(configuration)
    end
  end
end
