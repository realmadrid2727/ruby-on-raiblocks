require_relative 'initializer'
require_relative 'account_history'

module Raiblocks
  class Account < Initializer
    attr_accessor :account,
                  :balance,
                  :balances,
                  :block,
                  :frontier,
                  :history,
                  :key,
                  :modified_timestamp,
                  :moved,
                  :open_block,
                  :pending,
                  :removed,
                  :representative,
                  :representative_block,
                  :weight

    def initialize(*args)
      super

      set_history if history
    end

    def set_history
      array = []
      history.each { |_history| array << Raiblocks::AccountHistory.new(_history) }
      @history = array
    end

  end
end
