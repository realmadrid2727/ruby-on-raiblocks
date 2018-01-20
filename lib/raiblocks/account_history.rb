require_relative 'initializer'

module Raiblocks
  class AccountHistory < Initializer
    attr_accessor :account,
                  :amount,
                  :hash,
                  :type
  end
end
