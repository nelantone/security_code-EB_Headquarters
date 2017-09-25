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
end
