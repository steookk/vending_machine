# frozen_string_literal: true

RSpec.describe VendingMachine::Services::Change::NewInput do
  describe '.call' do
    subject(:call) { described_class.call(user_input: input) }

    describe 'success' do
      context 'with cents' do
        let(:input) { '10p' }

        it 'returns the cents representation of the input' do
          expect(call).to eq 10
        end
      end

      context 'with pounds' do
        let(:input) { '£1' }

        it 'returns the cents representation of the input' do
          expect(call).to eq 100
        end
      end
    end

    describe 'invalid' do
      let(:input) { 'aa' }

      it 'returns 0' do
        expect(call).to eq 0
      end
    end
  end
end
