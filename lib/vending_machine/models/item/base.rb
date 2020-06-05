# frozen_string_literal: true

module VendingMachine
  module Models
    module Item
      class Base
        attr_reader :name, :price

        def initialize
          raise NotImplementedError, __method__
        end

        def to_s
          name
        end
      end
    end
  end
end
