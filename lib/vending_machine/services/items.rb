# frozen_string_literal: true

module VendingMachine
  module Services
    module Items
      class << self
        def new_input(user_input:)
          NewInput.new(user_input)
        end
      end
    end
  end
end
