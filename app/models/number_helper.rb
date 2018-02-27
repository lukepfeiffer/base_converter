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

  def self.invalid_floating(number, from)
    if from == "2"
      valid_string = ".01"
    elsif from == "8"
      valid_string = ".01234567"
    elsif from == "10"
      valid_string = ".01234567890"
    elsif from == "16"
      valid_string = ".01234567890abcdefABCDEF"
    end
    length = number.length

    length.times do |i|
      if !valid_string.include?( number[i] )
        return true
      end
    end

    false
  end

  def self.float_to_decimal(number, from)

    if !number.include?( "0." )
      return "NaN"
    end

    number = number.split("0.").second

    if NumberHelper.invalid(number, from)
      return "NaN"
    end

    length = number.length
    answer = 0

    length.times do |n|
      exponent = n+1
      value = number[n]

      if number[n] == "a" || number[n] == "A"
        value = "10"
      elsif number[n] == "b" || number[n] == "B"
        value = "11"
      elsif number[n] == "c" || number[n] == "C"
        value = "12"
      elsif number[n] == "d" || number[n] == "D"
        value = "13"
      elsif number[n] == "e" || number[n] == "E"
        value = "14"
      elsif number[n] == "f" || number[n] == "F"
        value = "15"
      end

      answer += ( value.to_d / ( from.to_i ** exponent ) )
    end

    return answer.to_s
  end
end
