# frozen_string_literal: true

RSpec.describe VendingMachine::Models::Machine do
  describe '#to_s' do
    let(:configuration) { { '1' => ::VendingMachine::Models::Item::CocaCola.new } }
    let(:machine) { described_class.new(configuration: configuration) }
    subject(:list_of_items) { machine.to_s }

    it 'returns a string' do
      expect(list_of_items).to be_a String
    end

    it 'lists the items offered by the machine' do
      expect(list_of_items).to eq '#1 ===> Coca Cola 0.33cl'
    end
  end
end
