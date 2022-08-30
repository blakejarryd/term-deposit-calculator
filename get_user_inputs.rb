# Methods to get and validate user inputs
def get_investment_amount
  puts "What is the your investment amount ($)?"
  investment_amount = Integer(gets) rescue false
  if !investment_amount or investment_amount <= 0
    puts "Please enter a positive integer."
    return get_investment_amount() end
  return investment_amount
end

def get_interest_rate
  puts "What is the interest rate p.a (%)?"
  interest_rate = Float(gets).round(2) rescue false
  if !interest_rate or interest_rate <= 0
    puts "Please enter a positive number."
    return get_interest_rate end
  return interest_rate
end

def get_investment_term
  puts "What is the investment term in months (e.g. 24 = 2 years)?"
  investment_term = Integer(gets) rescue false
  if !investment_term or investment_term <= 0
    puts "Please enter a positive integer."
    return get_investment_term end
  return investment_term
end

def get_interest_frequency
  acceptable_frequencies = Array['monthly', 'quarterly', 'annually', 'maturity']
  puts "What is the interest payment frequency ('Monthly', 'Quarterly', 'Annually', 'Maturity')?"
  interest_frequency = gets.chomp().downcase
  if !acceptable_frequencies.include? interest_frequency
    puts "Please enter a valid frequency."
    return get_interest_frequency end
  return interest_frequency
end

# Wrapper method to get all TD details from user
def get_term_deposit_details 
  investment_amount = get_investment_amount
  interest_rate = get_interest_rate
  investment_term = get_investment_term
  interest_frequency = get_interest_frequency
  return {
    'user_investment_amount' => investment_amount, 
    'user_interest_rate' => interest_rate, 
    'user_investment_term' => investment_term, 
    'user_interest_frequency' => interest_frequency
  }
end

# Method to get user to confirm the entered TD details are correct
def confirm_details(td_data)
  puts "---------------------INVESTMENT DETAILS-----------------------------"
  puts "Investment amount: $#{td_data['user_investment_amount']}"
  puts "Interest rate: #{td_data['user_interest_rate']}%"
  puts "Investment term: #{td_data['user_investment_term']} months"
  puts "Interest frequency: #{td_data['user_interest_frequency']}"
  puts "--------------------------------------------------------------------"
  puts "Are these details correct (y/n)?"
  acceptance = String(gets.chomp()).downcase
  #loop acceptance prompt while response is not equal to 'y' or 'n'
  while !['y','n'].include? acceptance
    puts "please enter 'y' to accept or 'n' to resubmit details."
    acceptance = String(gets.chomp()).downcase
  end
  if acceptance == 'n'
    return get_term_deposit_details
  end
end