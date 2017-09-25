# require 'spec_helper', 'security_code' ...  *in ~\.rspec

describe SecurityCode do
  let(:keypad) { (1..9).to_a.freeze }

  it 'is available as described_class' do
    expect(described_class).to eq(SecurityCode)
  end

  it 'is a 9 characters array' do
    expect(keypad.size).to eq(9)
  end

  describe '#one' do
    one_movement =  described_class.new.one(:d)
    it 'has down movement' do
      expect(one_movement).to eq(4)
    end
  end

  it 'only first list_line has as starting point 5' do
    first_list_line = [ 1, 3, 7, 9, 2, 9 ]
    initial_list_line = [5] + first_list_line
    expect(initial_list_line.first).to eq(5)
  end
end
