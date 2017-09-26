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
end
