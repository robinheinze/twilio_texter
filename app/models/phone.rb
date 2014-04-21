class Phone
  def self.format(number)
    if number.length == 10
      result = "("
      result += number[0,3]
      result +=  ") "
      result += number[3,3]
      result += "-"
      result += number[6,4]
    elsif number.length == 7
      result += number[0,3]
      result += "-"
      result += number[3,4]
    end
  end
end
