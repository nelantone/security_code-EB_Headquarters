# require 'spec_helper', 'security_code' ...  *in ~\.rspec

describe SecurityCode do
  let(:keypad)     { (1..9).to_a.freeze }

  it 'is available as described_class' do
    expect(described_class).to eq(described_class)
  end

  it 'is a 9 characters array' do
    expect(keypad.size).to eql(9)
  end

  describe '#one' do
    move_down  = described_class.new.one(:d)
    move_up    = described_class.new.one(:u)
    move_right = described_class.new.one(:r)
    move_left  = described_class.new.one(:l)

    it 'moves down to 4' do
      expect(move_down).to eql(4)
    end

    it 'moves right to 2' do
      expect(move_right).to eql(2)
    end

    it 'is not moving' do
      expect(move_up).to eql(1)
      expect(move_left).to eql(1)
    end
  end

  describe '#two' do
    move_down  = described_class.new.two(:d)
    move_up    = described_class.new.two(:u)
    move_right = described_class.new.two(:r)
    move_left  = described_class.new.two(:l)


    it 'moves down to 5' do
      expect(move_down).to eql(5)
    end

    it 'moves right to 3' do
      expect(move_right).to eql(3)
    end

    it 'moves left to 1' do
      expect(move_left).to eql(1)
    end

    it 'is not moving' do
      expect(move_up).to eql(2)
    end
  end

  describe '#three' do
    move_down  = described_class.new.three(:d)
    move_up    = described_class.new.three(:u)
    move_right = described_class.new.three(:r)
    move_left  = described_class.new.three(:l)


    it 'moves down to 6' do
      expect(move_down).to eql(6)
    end


    it 'moves left to 2' do
      expect(move_left).to eql(2)
    end

    it 'is not moving' do
      expect(move_up).to eql(3)
      expect(move_right).to eql(3)
    end
  end

  describe '#four' do
    move_down  = described_class.new.four(:d)
    move_up    = described_class.new.four(:u)
    move_right = described_class.new.four(:r)
    move_left  = described_class.new.four(:l)

    it 'moves down to 7' do
      expect(move_down).to eql(7)
    end

    it 'moves right to 5' do
      expect(move_right).to eql(5)
    end

    it 'moves up to 1' do
      expect(move_up).to eql(1)
    end

    it 'is not moving' do
      expect(move_left).to eql(4)
    end
  end

  describe '#five' do
    move_down  = described_class.new.five(:d)
    move_up    = described_class.new.five(:u)
    move_right = described_class.new.five(:r)
    move_left  = described_class.new.five(:l)


    it 'moves down to 8' do
      expect(move_down).to eql(8)
    end

    it 'moves left to 4' do
      expect(move_left).to eql(4)
    end

    it 'moves right to 6' do
      expect(move_right).to eql(6)
    end

    it 'moves up to 2' do
      expect(move_up).to eql(2)
    end
  end

  describe '#six' do
    move_down  = described_class.new.six(:d)
    move_up    = described_class.new.six(:u)
    move_right = described_class.new.six(:r)
    move_left  = described_class.new.six(:l)


    it 'moves down to 9' do
      expect(move_down).to eql(9)
    end

    it 'moves left to 5' do
      expect(move_left).to eql(5)
    end

    it 'moves up to 3' do
      expect(move_up).to eql(3)
    end

    it 'is not moving' do
      expect(move_right).to eql(6)
    end
  end

  describe '#seven' do
    move_down  = described_class.new.seven(:d)
    move_up    = described_class.new.seven(:u)
    move_right = described_class.new.seven(:r)
    move_left  = described_class.new.seven(:l)

    it 'moves left to 8' do
      expect(move_right).to eql(8)
    end

    it 'moves up to 4' do
      expect(move_up).to eql(4)
    end

    it 'is not moving' do
      expect(move_down).to eql(7)
      expect(move_left).to eql(7)
    end
  end

  describe '#eight' do
    move_down  = described_class.new.eight(:d)
    move_up    = described_class.new.eight(:u)
    move_right = described_class.new.eight(:r)
    move_left  = described_class.new.eight(:l)

    it 'moves left to 7' do
      expect(move_right).to eql(9)
    end

    it 'moves up to 5' do
      expect(move_up).to eql(5)
    end

    it 'moves right to 9' do
      expect(move_right).to eql(9)
    end

    it 'is not moving' do
      expect(move_down).to eql(8)
    end
  end

  describe '#nine' do
    move_down  = described_class.new.nine(:d)
    move_up    = described_class.new.nine(:u)
    move_right = described_class.new.nine(:r)
    move_left  = described_class.new.nine(:l)

    it 'moves up to 6' do
      expect(move_up).to eql(6)
    end

    it 'moves left to 8' do
      expect(move_left).to eql(8)
    end

    it 'is not moving' do
      expect(move_down).to eql(9)
      expect(move_right).to eql(9)
    end
  end

  it 'only first list_line has as starting point 5' do
    first_list_line = [1, 3, 7, 9, 2, 9]
    initial_list_line = [5] + first_list_line
    expect(initial_list_line.first).to eq(5)
  end

  context 'when we move we transfor the digit in the related method-number' do
    it '#digit_matcher' do
      last_list_line = 2
      expect(described_class.digit_matcher(last_list_line)).to eql(:two)
    end
  end
end
