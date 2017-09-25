# require 'spec_helper', 'security_code' ...  *in ~\.rspec

describe SecurityCode do
  let(:keypad)     { (1..9).to_a.freeze }
  let(:move_down)  { described_class.new.one(:d) }
  let(:move_up)    { described_class.new.one(:u) }
  let(:move_right) { described_class.new.one(:r) }
  let(:move_left)  { described_class.new.one(:l) }

  it 'is available as described_class' do
    expect(described_class).to eq(described_class)
  end

  it 'is a 9 characters array' do
    expect(keypad.size).to eq(9)
  end

  describe '#one' do
    it 'moves down to 4' do
      expect(move_down).to eq(4)
    end

    it 'moves right to 2' do
      expect(move_right).to eq(2)
    end

    it 'is not moving' do
      expect(move_up).to eq(1)
      expect(move_left).to eq(1)
    end
  end

  it 'only first list_line has as starting point 5' do
    first_list_line = [1, 3, 7, 9, 2, 9]
    initial_list_line = [5] + first_list_line
    expect(initial_list_line.first).to eq(5)
  end
end
