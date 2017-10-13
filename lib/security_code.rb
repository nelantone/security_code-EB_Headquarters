# :nodoc:
class SecurityCode
  def one(movement)
    if movement.eql?(:d)
      4
    elsif movement.eql?(:r)
      2
    else
      1
    end
  end

  def two(movement)
    case movement
    when :d
      5
    when :l
      1
    when :r
      3
    else
      2
    end
  end

  def three(movement)
    case movement
    when :d
      6
    when :l
      2
    else
      3
    end
  end

  def four(movement)
    case movement
    when :d
      7
    when :u
      1
    when :r
      5
    else
      4
    end
  end

  def five(movement)
    case movement
    when :d
      8
    when :u
      2
    when :r
      6
    when :l
      4
    else
      5
    end
  end

  def six(movement)
    case movement
    when :d
      9
    when :u
      3
    when :l
      5
    else
      6
    end
  end

  def seven(movement)
    case movement
    when :u
      4
    when :r
      8
    else
      7
    end
  end

  def eight(movement)
    case movement
    when :u
      5
    when :r
      9
    when :l
      7
    else
      8
    end
  end

  def nine(movement)
    case movement
    when :u
      6
    when :l
      8
    else
      9
    end
  end

  def self.digit_to_method(number)
    method_number = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }
    method_number.key(number)
  end

  def self.digit_method_processor(number, movement)
    method_number = SecurityCode.digit_to_method(number).to_s
    SecurityCode.new.send(method_number, movement)
  end

  def self.movement_lines_splitter(document)
    lines = document.split(/\n/)
    movement_lines = []
    lines.each { |line| movement_lines << line.split('').map { |a| a.to_sym.downcase }.to_a }
    movement_lines
  end

  def self.password_decoder(document)
    result_array = []

    movement_lines_splitter(document).map do |movements|
      number = result_array.last unless result_array.empty?
      number ||= 5

      movements.each do |movement|
        number = digit_method_processor(number, movement)
      end
      result_array << number
    end
    result_array
  end
end
