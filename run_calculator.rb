require 'get_user_inputs'
require 'term_deposit_calculator'

# Invoke methods to get details from user
user_td_data = get_term_deposit_details
confirm_details(user_td_data)
# Create TD object based on user input
new_td = TermDeposit.new(
  user_td_data['user_investment_amount'],
  user_td_data['user_interest_rate'],
  user_td_data['user_investment_term'],
  user_td_data['user_interest_frequency'])
# Call calculate end balance method on new TD
new_td.calculate_end_balance