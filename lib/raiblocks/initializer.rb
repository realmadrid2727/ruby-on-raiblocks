module Raiblocks
  class Initializer
    def initialize(hash)
      hash.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end
end
