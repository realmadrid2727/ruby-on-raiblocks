require 'httparty'

require_relative 'raiblocks/account'
require_relative 'raiblocks/command'

module Raiblocks
  class RPC
    def initialize(options)
      @url = options[:url]
      @port = options[:port]
    end

    def method_missing(_method)
      Raiblocks::Command.new(_method, @url, @port)
    end
  end
end

rpc = Raiblocks::RPC.new({url: "http://www.providentjewelry.com", port: 7076})

result = rpc.account.account_history(
  account: "xrb_3t6k35gi95xu6tergt6p69ck76ogmitsa8mnijtpxm9fkcm736xtoncuohr3",
  count: 2
)

puts result.inspect

#def method_missing(_method)
#  Raiblocks.const_get(_method.capitalize).new(@url, @port)
#end
