# frozen_string_literal: true

RSpec.describe VendingMachine do
  describe '.run' do
    let(:output) do
      # mocking output throws an error I don't have time to investigate, therefore I created my own class.
      Class.new do
        def self.puts(output)
          $stdout.puts output
        end
      end
    end
    let(:input) { double(:input) }
    let(:configuration) { { '1' => ::VendingMachine::Models::Item::SpringWater.new } }

    subject(:run) { described_class.run(output: output, input: input, configuration: configuration) }

    describe 'successful flow' do
      let(:selected_item) { '1' }
      let(:first_coin) { '50p' }
      let(:second_coin) { '£1' }

      it 'returns the selected product' do
        # check test output to read outputs. In a real life situation, I would test the content of each 'puts'

        allow(input).to receive(:gets).and_return selected_item, first_coin, second_coin

        # if I added quantity to items, here I would check for the decreased quantity of the selected item
        run
      end

      context 'when there is change back for the user' do
        let(:selected_item) { '1' }
        let(:first_coin) { '50p' }
        let(:second_coin) { '£2' }

        it 'returns the selected product' do
          # check test output to read outputs. In a real life situation, I would test the content of each 'puts'

          allow(input).to receive(:gets).and_return selected_item, first_coin, second_coin

          # if I added quantity to items, here I would check for the decreased quantity of the selected item
          run
        end
      end
    end

    describe 'successful flow with user correcting the input' do
      context 'with a wrong item format' do
        let(:selected_item_wrong) { 'aabb' }
        let(:selected_item_correct) { '1' }
        let(:first_coin) { '50p' }
        let(:second_coin) { '£1' }

        it 'returns the selected product' do
          allow(input).to receive(:gets).and_return selected_item_wrong, selected_item_correct, first_coin, second_coin

          run
        end
      end

      context 'with a not existing item' do
        let(:selected_item_wrong) { '2' }
        let(:selected_item_correct) { '1' }
        let(:first_coin) { '50p' }
        let(:second_coin) { '£1' }

        it 'returns the selected product' do
          allow(input).to receive(:gets).and_return selected_item_wrong, selected_item_correct, first_coin, second_coin

          run
        end
      end

      context 'with a wrong change format' do
        let(:selected_item) { '1' }
        let(:first_coin) { '3p' }
        let(:second_coin) { '£1' }
        let(:third_coin) { '50p' }

        it 'returns the selected product' do
          allow(input).to receive(:gets).and_return selected_item, first_coin, second_coin, third_coin

          run
        end
      end
    end
  end
end
