# frozen_string_literal: true

module VendingMachine
  module Models
    module Item
      class CocaCola < Base
        def initialize
          @name = 'Coca Cola 0.33cl'
          @price = 250
        end
      end
    end
  end
end
