# require 'spec_helper', 'security_code' ...  *in ~\.rspec

describe SecurityCode do
  let(:keypad)     { (1..9).to_a.freeze }

  it 'is available as described_class' do
    expect(described_class).to eq(described_class)
  end

  it 'is a 9 characters array' do
    expect(keypad.size).to be(9)
  end

  describe '#one' do
    move_down  = described_class.new.one(:d)
    move_up    = described_class.new.one(:u)
    move_right = described_class.new.one(:r)
    move_left  = described_class.new.one(:l)

    it 'moves down to 4' do
      expect(move_down).to be(4)
    end

    it 'moves right to 2' do
      expect(move_right).to be(2)
    end

    it 'is not moving' do
      expect(move_up).to be(1)
      expect(move_left).to be(1)
    end
  end

  describe '#two' do
    move_down  = described_class.new.two(:d)
    move_up    = described_class.new.two(:u)
    move_right = described_class.new.two(:r)
    move_left  = described_class.new.two(:l)

    it 'moves down to 5' do
      expect(move_down).to be(5)
    end

    it 'moves right to 3' do
      expect(move_right).to be(3)
    end

    it 'moves left to 1' do
      expect(move_left).to be(1)
    end

    it 'is not moving' do
      expect(move_up).to be(2)
    end
  end

  describe '#three' do
    move_down  = described_class.new.three(:d)
    move_up    = described_class.new.three(:u)
    move_right = described_class.new.three(:r)
    move_left  = described_class.new.three(:l)

    it 'moves down to 6' do
      expect(move_down).to be(6)
    end

    it 'moves left to 2' do
      expect(move_left).to be(2)
    end

    it 'is not moving' do
      expect(move_up).to be(3)
      expect(move_right).to be(3)
    end
  end

  describe '#four' do
    move_down  = described_class.new.four(:d)
    move_up    = described_class.new.four(:u)
    move_right = described_class.new.four(:r)
    move_left  = described_class.new.four(:l)

    it 'moves down to 7' do
      expect(move_down).to be(7)
    end

    it 'moves right to 5' do
      expect(move_right).to be(5)
    end

    it 'moves up to 1' do
      expect(move_up).to be(1)
    end

    it 'is not moving' do
      expect(move_left).to be(4)
    end
  end

  describe '#five' do
    move_down  = described_class.new.five(:d)
    move_up    = described_class.new.five(:u)
    move_right = described_class.new.five(:r)
    move_left  = described_class.new.five(:l)

    it 'moves down to 8' do
      expect(move_down).to be(8)
    end

    it 'moves left to 4' do
      expect(move_left).to be(4)
    end

    it 'moves right to 6' do
      expect(move_right).to be(6)
    end

    it 'moves up to 2' do
      expect(move_up).to be(2)
    end
  end

  describe '#six' do
    move_down  = described_class.new.six(:d)
    move_up    = described_class.new.six(:u)
    move_right = described_class.new.six(:r)
    move_left  = described_class.new.six(:l)

    it 'moves down to 9' do
      expect(move_down).to be(9)
    end

    it 'moves left to 5' do
      expect(move_left).to be(5)
    end

    it 'moves up to 3' do
      expect(move_up).to be(3)
    end

    it 'is not moving' do
      expect(move_right).to be(6)
    end
  end

  describe '#seven' do
    move_down  = described_class.new.seven(:d)
    move_up    = described_class.new.seven(:u)
    move_right = described_class.new.seven(:r)
    move_left  = described_class.new.seven(:l)

    it 'moves left to 8' do
      expect(move_right).to be(8)
    end

    it 'moves up to 4' do
      expect(move_up).to be(4)
    end

    it 'is not moving' do
      expect(move_down).to be(7)
      expect(move_left).to be(7)
    end
  end

  describe '#eight' do
    move_down  = described_class.new.eight(:d)
    move_up    = described_class.new.eight(:u)
    move_right = described_class.new.eight(:r)
    move_left  = described_class.new.eight(:l)

    it 'moves left to 7' do
      expect(move_left).to be(7)
    end

    it 'moves up to 5' do
      expect(move_up).to be(5)
    end

    it 'moves right to 9' do
      expect(move_right).to be(9)
    end

    it 'is not moving' do
      expect(move_down).to be(8)
    end
  end

  describe '#nine' do
    move_down  = described_class.new.nine(:d)
    move_up    = described_class.new.nine(:u)
    move_right = described_class.new.nine(:r)
    move_left  = described_class.new.nine(:l)

    it 'moves up to 6' do
      expect(move_up).to be(6)
    end

    it 'moves left to 8' do
      expect(move_left).to be(8)
    end

    it 'is not moving' do
      expect(move_down).to be(9)
      expect(move_right).to be(9)
    end
  end

  it 'only first list_line has as starting point 5' do
    first_list_line = [1, 3, 7, 9, 2, 9]
    initial_list_line = [5] + first_list_line
    expect(initial_list_line.first).to eq(5)
  end

  context 'We transfor the digit in the related method-number' do
    it '#digit_to_method' do
      last_list_line = 2
      expect(described_class.digit_to_method(last_list_line)).to be(:two)
    end
  end

  context 'When we save the digit_matcher and we use it on the next movement' do
    it 'keeps to #digit_method_processor to same position' do
      number = 2
      movement = :u

      expect(described_class.digit_method_processor(number, movement)).to be(2)
    end

    it 'moves #digit_method_processor to a correct possition' do
      number = 4
      movement = :u

      expect(described_class.digit_method_processor(number, movement)).to be(1)
    end
  end

  context 'when we pass the initial full line as an array' do
    document = "URDL\nLUURRDDD\nLLLURULL"
    it '#line_result' do
      expect(described_class.line_result(document)).to be_a(Integer)
      expect(described_class.line_result(document)).to be(5)
    end
  end

  context 'when we have a text' do
    it 'is #full_movements an array ' do
      document = "URDL\nLUURRDDD\nLLLURULL"
      expect(described_class.full_movements(document)).to be_a(Array)
    end

    it '#full_movements is an array of arrays for each line' do
      document = "URDL\nLUURRDDD\nLLLURULL"

      described_class.full_movements(document) do
        is_expected.to all(be_an(String))
      end
    end
  end
end
