# frozen_string_literal: true

module VendingMachine
  module Models
    module Item
      class Mars < Base
        def initialize
          @name = 'Mars chocolate bar'
          @price = 200
        end
      end
    end
  end
end
