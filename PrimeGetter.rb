class PrimeGetter
  attr_accessor :upperlimit, :prime_array, :prime_candidate, :errormessage
  def initialize(upperlimit)
    @upperlimit = upperlimit
  end

  def geterrormessage
    unless @upperlimit.is_a? Integer
      return "n must be an integer."
    end
    if @upperlimit < 0
      return "n must be greater than 0."
    end
    return ""
  end

  def isvalidinput
    return (geterrormessage == "")
  end

  def is_candidate_prime
    is_prime = true
    @prime_array.each do |prime|
      if (@prime_candidate % prime == 0)
        is_prime = false
        break
      elsif (prime > Math.sqrt(@prime_candidate))
        break
      end
    end
    return is_prime
  end

  def prime_not_upper_than
    if (not isvalidinput)
      puts @errormessage
      return nil
    end

    if (@upperlimit <= 1)
      return []
    end

    @prime_array = [2]
    @prime_candidate = 3
    while (@prime_candidate < @upperlimit) do
      if is_candidate_prime
        @prime_array.push(@prime_candidate)
      end
      @prime_candidate = @prime_candidate+1
    end 
    return @prime_array
  end
end

if __FILE__ == $0
  prime = PrimeGetter.new(ARGV[0].to_i)
  puts prime.prime_not_upper_than
end

# Get prime numbers not upper than maximum number
#
# pseudo code

# if maximum number is not a integer or lower than 1
#   print error message and return nil
#
# start with prime numbers = [2] and number = 3
# while (number is not upper than maximum number)
#   if number is prime number
#     add the number to prime numbers
#   increase the number by 1
# return prime numbers
