# frozen_string_literal: true

module VendingMachine
  module Services
    module Items
      class NewInput
        attr_reader :user_input

        def initialize(string)
          @user_input = string
        end

        def valid?
          user_input.match? /\A\d*$/
        end

        def error_message
          'The format of the input is wrong. It must be a number. Please try again:'
        end
      end
    end
  end
end
