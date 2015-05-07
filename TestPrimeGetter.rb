require_relative "PrimeGetter"
require "minitest/autorun"

class TestPrimeGetter < Minitest::Test
  def helper_prime_not_upper_than(upperlimit)
    prime = PrimeGetter.new(upperlimit)
    return prime.prime_not_upper_than
  end

  def helper_isvalidinput(number)
    prime = PrimeGetter.new(number)
    return prime.isvalidinput
  end

  def helper_geterrormessage(number)
    prime = PrimeGetter.new(number)
    return prime.geterrormessage
  end

  def helper_is_candidate_prime(prime_candidate, prime_array)
    prime = PrimeGetter.new(0)
    prime.prime_array = prime_array
    prime.prime_candidate = prime_candidate
    return prime.is_candidate_prime
  end

  def assert_false(e)
    assert (not e)
  end

  def test_isvalidinput
    assert helper_isvalidinput(10)
    assert helper_isvalidinput(0)
    assert helper_isvalidinput(1)
    assert helper_isvalidinput(2)
    assert_false helper_isvalidinput(-10)
    assert_false helper_isvalidinput(:abc)
    assert_false helper_isvalidinput("abc")
    assert_false helper_isvalidinput([10])
  end

  def test_geterrormessage
    errormessage_notinteger = "n must be a integer."
    errormessage_negative = "n must be greater than 0."

    assert_equal "must be a integer", helper_geterrormessage(-10)
    assert_equal "must be greater than 0", helper_geterrormessage(:abc)
    assert_equal "must be greater than 0", helper_geterrormessage("abc")
    assert_equal "must be greater than 0", helper_geterrormessage([10])
  end

  def test_prime_not_upper_than
    assert_nil helper_prime_not_upper_than(:abc)
    assert_nil helper_prime_not_upper_than(-1)
    assert_equal helper_prime_not_upper_than(0), []
    assert_equal helper_prime_not_upper_than(1), []
    assert_equal helper_prime_not_upper_than(2), [2]
    assert_equal helper_prime_not_upper_than(10), [2,3,5,7]
  end

  def test_is_candidate_prime
    assert helper_is_candidate_prime(3, [2])
    assert_false helper_is_candidate_prime(4, [2,3])
    assert_false helper_is_candidate_prime(9, [2,3,5,7])
    assert helper_is_candidate_prime(11, [2,3,5,7])
  end
end
