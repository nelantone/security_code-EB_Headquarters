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

  def self.array_splitter(line)
    line.to_s.split('').map { |a| a.to_sym.downcase }.to_a
  end

  def self.line_result(document)
    if full_movements(document).first
      number ||= 5
    else
      number = password_code(document).last
    end

    result_array = full_movements(document).map do |movement|
      number = digit_method_processor(number, movement)
    end
    result_array.last
  end

  def self.password_code(document)
    full_movements(document)
    security_code = []
    security_code << line_result(document)
  end

  def self.full_movements(document)
    movement_lines = []
    lines = document.split(/\n/)
    lines.each { |line| movement_lines << line.split('').to_a }
  end
end
