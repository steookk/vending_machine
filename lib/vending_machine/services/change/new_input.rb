# frozen_string_literal: true

module VendingMachine
  module Services
    module Change
      class NewInput
        PERMITTED_INPUTS = ['1p', '2p', '5p', '10p', '20p', '50p', '£1', '£2'].freeze

        class << self
          def call(user_input:)
            new(user_input).call
          end
        end

        attr_reader :user_input

        def initialize(string)
          @user_input = string
        end

        def call
          return 0 unless PERMITTED_INPUTS.include? user_input

          to_cents
        end

        private

        def to_cents
          user_input.include?('p') ? user_input.split('p').first.to_i
                                   : (user_input.split('£').last.to_i * 100)
        end
      end
    end
  end
end
