module Framework
  class AbstractServer
    attr_reader :stopping, :running

    def initialize(&block)
      @stopping = false
      @running = false

      shutdown_on_interrupt

      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= {}
    end

    def start
      @running = true

      start_server

      @running = false
      @stopping = false
    end

    def stop
      @stopping = true

      stop_server
    end

    def log(message, level=:info)
      fail NotImplementedError
    end

    private

    def start_server
      fail NotImplementedError
    end

    def stop_server
      fail NotImplementedError
    end

    def shutdown_on_interrupt
      trap('SIGINT') { shutdown unless @stopping if @running }
    end

    def shutdown
      print "\r"

      log('shutdown signal received')

      stop
    end
  end
end
