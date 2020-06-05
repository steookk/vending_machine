# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module VendingMachine
  class << self
    attr_reader :machine, :output, :input

    def run(output: $stdout, input: $stdin, configuration: {})
      @output = output
      @input = input
      @machine = Models::Machine.new(configuration: configuration)

      # we could do a loop here and exit it with a 'exit' or 'quit' input
      run_interaction
    end

    private

    def run_interaction
      output.puts 'Available products'

      output.puts machine
      output.puts 'Please type the number of the desired item'

      item = find_item { select_item }

      output.puts "Price: #{formatted_price(item.price)}"
      output.puts "Pay with '1p', '2p', '5p', '10p', '20p', '50p', '£1', '£2'"

      change_for_user = make_positive(collect_change(needed: item.price))

      output.puts "Please take your item: #{item.name}"
      output.puts "Please take your change: #{formatted_price(change_for_user)}" if change_for_user != 0
    end

    def select_item
      new_input = Services::Items.new_input(user_input: input.gets.chomp)

      return new_input.user_input if new_input.valid?

      output.puts new_input.error_message
      select_item
    end

    def find_item(&block)
      user_input = yield

      item = machine.find_item key: user_input
      return item if item

      output.puts machine.error_message
      find_item(&block)
    end

    def collect_change(needed:)
      output.puts 'Please insert change'
      paid = Services::Change.validate(user_input: input.gets.chomp)

      needed -= paid
      output.puts "Remaining to be paid: #{formatted_price(needed)}" if needed > 0

      needed <= 0 ? needed : collect_change(needed: needed)
    end

    def formatted_price(amount)
      amount >= 100 ? "£#{(amount.to_f / 100)}" : "#{amount}p"
    end

    def make_positive(amount)
      -(amount)
    end
  end
end
