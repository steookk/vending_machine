# frozen_string_literal: true

module VendingMachine
  module Models
    class Machine
      attr_reader :error_message

      def initialize(configuration: {})
        @configuration = configuration
      end

      def to_s
        configuration.each_with_object([]) do |(key, item), object|
          object << "##{key} ===> #{item}"
        end.join("\n")
      end

      def find_item(key:)
        item = configuration.fetch(key, nil)
        if item.nil?
          @error_message = 'The item is not existing in this machine. Please try again:'
        end
        item
      end

      private

      attr_reader :configuration
    end
  end
end
