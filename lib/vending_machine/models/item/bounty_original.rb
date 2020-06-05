# frozen_string_literal: true

module VendingMachine
  module Models
    module Item
      class BountyOriginal < Base
        def initialize
          @name = 'Bounty chocolate bar original coconut'
          @price = 200
        end
      end
    end
  end
end
