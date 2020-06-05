# frozen_string_literal: true

RSpec.describe VendingMachine::Services::Items::NewInput do
  describe '#valid?' do
    let(:new_input) { described_class.new(input) }

    subject(:valid?) { new_input.valid? }

    describe 'success' do
      let(:input) { '1' }

      it 'returns true' do
        expect(valid?).to be true
      end
    end

    describe 'failure' do
      let(:input) { 'aa' }

      it 'returns false' do
        expect(valid?).to be false
      end
    end
  end
end
