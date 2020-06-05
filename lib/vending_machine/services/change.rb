# frozen_string_literal: true

module VendingMachine
  module Services
    module Change
      class << self
        def validate(**args)
          NewInput.call(**args)
        end
      end
    end
  end
end
