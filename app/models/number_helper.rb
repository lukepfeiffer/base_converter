class NumberHelper
  def self.convert(number, from, to)
    if NumberHelper.invalid(number, from)
      return "NaN"
    end

    if from == "2"
      NumberHelper.from_binary(number, to)
    elsif from == "8"
      NumberHelper.from_octal(number, to)
    elsif from == "10"
      NumberHelper.from_decimal(number, to)
    elsif from == "16"
      NumberHelper.from_hex(number, to)
    end
  end

  def self.from_binary(number, to)
    if to == "8"
      number.to_i(2).to_s(8)
    elsif to == "10"
      number.to_i(2).to_s(10)
    elsif to == "16"
      number.to_i(2).to_s(16)
    elsif to == "2"
      number
    end
  end

  def self.from_octal(number, to)
    if to == "2"
      number.to_i(8).to_s(2)
    elsif to == "10"
      number.to_i(8).to_s(10)
    elsif to == "16"
      number.to_i(8).to_s(16)
    elsif to == "8"
      number
    end
  end

  def self.from_decimal(number, to)
    if to == "2"
      number.to_i(10).to_s(2)
    elsif to == "8"
      number.to_i(10).to_s(8)
    elsif to == "16"
      number.to_i(10).to_s(16)
    elsif to == "10"
      number
    end
  end

  def self.from_hex(number, to)
    if to == "2"
      number.to_i(16).to_s(2)
    elsif to == "8"
      number.to_i(16).to_s(8)
    elsif to == "10"
      number.to_i(16).to_s(10)
    elsif to == "16"
      number
    end
  end

  def self.invalid(number, from)
    if from == "2"
      valid_string = "01"
    elsif from == "8"
      valid_string = "01234567"
    elsif from == "10"
      valid_string = "01234567890"
    elsif from == "16"
      valid_string = "01234567890abcdefABCDEF"
    end

    length = number.length

    length.times do |i|
      if !valid_string.include?( number[i] )
        return true
      end
    end

    false
  end
end
