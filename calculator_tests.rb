require 'test/unit'
require 'term_deposit_calculator'

class TermDepositCalcTest < Test::Unit::TestCase
  def test_monthly_interest
    #interest frequency monthly, varying amounts, rates and terms
    @interest_frequency = 'monthly'
    assert_equal(10125, TermDeposit.new(10000, 5, 3, @interest_frequency).calculate_end_balance())
    assert_equal(17117, TermDeposit.new(16700, 3.3, 9, @interest_frequency).calculate_end_balance())
    assert_equal(7451, TermDeposit.new(7300, 2.05, 12, @interest_frequency).calculate_end_balance())
    assert_equal(126529, TermDeposit.new(123456, 1.23, 24, @interest_frequency).calculate_end_balance())
    assert_equal(34042, TermDeposit.new(29800, 4, 40, @interest_frequency).calculate_end_balance())
  end
  def test_quarterly_interest
    #interest frequency quarterly, varying term lengths
    @interest_frequency = 'quarterly'
    assert_equal(10082, TermDeposit.new(10041, 0.7, 7, @interest_frequency).calculate_end_balance())
    assert_equal(23098, TermDeposit.new(22000, 4.2, 14, @interest_frequency).calculate_end_balance())
    assert_equal(54768, TermDeposit.new(50000, 5, 22, @interest_frequency).calculate_end_balance())
    assert_equal(5049, TermDeposit.new(4768, 1.5, 46, @interest_frequency).calculate_end_balance())
    assert_equal(407436 ,TermDeposit.new(405405, 0.1, 60, @interest_frequency).calculate_end_balance())
  end
  def test_yearly_interest
    #interest frequency yearly, varying term lengths
    @interest_frequency = 'annually'
    assert_equal(62489, TermDeposit.new(60000, 5, 10, @interest_frequency).calculate_end_balance())
    assert_equal(68682, TermDeposit.new(67890, 1, 14, @interest_frequency).calculate_end_balance())
    assert_equal(1261, TermDeposit.new(1234, 1.23, 22, @interest_frequency).calculate_end_balance())
    assert_equal(8319, TermDeposit.new(7250, 3.5, 48, @interest_frequency).calculate_end_balance())
    assert_equal(11040 ,TermDeposit.new(10000, 2, 60, @interest_frequency).calculate_end_balance())
  end
  def test_maturity_interest
    #interest frequency yearly, varying term lengths
    @interest_frequency = 'maturity'
    assert_equal(5041, TermDeposit.new(5000, 1, 10, @interest_frequency).calculate_end_balance())
    assert_equal(10518, TermDeposit.new(9876, 4.34, 18, @interest_frequency).calculate_end_balance())
    assert_equal(26555, TermDeposit.new(25000, 3.11, 24, @interest_frequency).calculate_end_balance())
    assert_equal(119958, TermDeposit.new(99999, 4.99, 48, @interest_frequency).calculate_end_balance())
    assert_equal(11000 ,TermDeposit.new(10000, 2, 60, @interest_frequency).calculate_end_balance())
  end
end