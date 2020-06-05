# frozen_string_literal: true

module VendingMachine
  module Models
    module Item
      class SpringWater < Base
        def initialize
          @name = 'Spring Water 0.5L'
          @price = 150
        end
      end
    end
  end
end
