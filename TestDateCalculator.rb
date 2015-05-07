require_relative "DateCalculator"
require "minitest/autorun"

class TestDateCalculator < Minitest::Test
  def helper_leapyear(year)
    calc = DateCalculator.new(0)
    calc.year = year
    return calc.leap_year?
  end

  def helper_addleapyear(days, year)
    calc = DateCalculator.new(days)
    calc.year = year
    calc.add_leap_year
    return calc.year
  end

  def helper_addregularyear(days, year)
    calc = DateCalculator.new(days)
    calc.year = year
    calc.add_regular_year
    return calc.year
  end

  def helper_convert(days, year)
    calc = DateCalculator.new(days)
    calc.year = year
    return calc.convert
  end

  def assert_false(e)
    assert (not e)
  end

  def test_leapyear
    assert helper_leapyear(2004)
    assert_false helper_leapyear(1900)
    assert helper_leapyear(2000)
  end

  def test_addleapyear
    assert_equal helper_addleapyear(255,2008), 2008
    assert_equal helper_addleapyear(400,2008), 2009
    assert_equal helper_addleapyear(366,2008), 2009
  end

  def test_addregularyear
    assert_equal helper_addregularyear(255,2009), 2009
    assert_equal helper_addregularyear(400,2009), 2010
    assert_equal helper_addregularyear(365,2009), 2010
  end

  def test_convert
    assert_equal helper_convert(364,2009), 2009
    assert_equal helper_convert(365,2008), 2008
    assert_equal helper_convert(365,2009), 2010
    assert_equal helper_convert(366,2008), 2009
    assert_equal helper_convert(366,2009), 2010
    assert_equal helper_convert(367,2008), 2009
  end
end
