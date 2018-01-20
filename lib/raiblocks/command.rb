module Raiblocks
  class Command
    def initialize(_method, url, port)
      @url = url
      @port = port
      @method = _method
    end

    def method_missing(action, *args)
      response = HTTParty.post(
        "#{@url}:#{@port}",
        {
          body: {
            action: action,
          }.merge(args.first).to_json
        }
      )
      
      Raiblocks.const_get(@method.capitalize).new(response.parsed_response)
    end
  end
end
