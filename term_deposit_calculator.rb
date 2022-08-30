# Term deposit class to containing end balance calc method
class TermDeposit
  def initialize(investment_amount, interest_rate, investment_term, interest_frequency)
    @investment_amount = investment_amount
    @interest_rate = interest_rate
    @investment_term = investment_term
    @interest_frequency = interest_frequency
  end
  #Compound interest equation...
  #ending balance = starting balance * (1 * interest_rate_per_period)^n_periods
  def calculate_end_balance
    term_in_years = @investment_term/12.0
    #convert percentage to decimal
    yearly_interest = @interest_rate/100.0
    periods_per_year = {
      'monthly' => 12,
      'quarterly' => 4,
      'annually' => 1,
      'maturity' => 12.0/@investment_term
    }
    #interest_rate_per_period is yearly interest divided by number of payments in year
    interest_rate_per_period = yearly_interest/periods_per_year[@interest_frequency]
    #number of periods is yearly duration divided by number of periods per year
    n_periods = term_in_years * (periods_per_year[@interest_frequency])
    #final calc as per compound interest equation
    ending_balance = Integer(@investment_amount * (1 + interest_rate_per_period)**n_periods)
    #DEBUG INFO - Leaving in - Could be useful to display to the user to explain calc
    # puts "term in years: #{term_in_years}"
    # puts "yearly interest: #{yearly_interest}"
    # puts "interest_rate_per_period: #{interest_rate_per_period}"
    # puts "n_periods: #{n_periods}"
    puts "---------------------CALCULATION OUTPUT-----------------------------"
    puts "Final balance: $#{ending_balance}"
    puts "Total interest earned: $#{ending_balance - @investment_amount}"
    puts "--------------------------------------------------------------------"
    #return value for unit test
    return ending_balance
  end
end






