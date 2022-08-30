# CLI Compound Interest Term Deposit Calculator

## What is for?

A calculator that takes in the 4 I's of term deposit compution and calculates an ending balance of a TD where income payments are reinvested throughout the term.
- Investment amount
- Interest Amount
- Investment term
- Interest payment frequency

## Dependancies
This is a Command Line Application written in Ruby. Therefore to run the calculator you will need to have Ruby installed on your machine.

You can follow the instructions here to get the latest Ruby version.
https://www.ruby-lang.org/en/downloads/


## Running the calculator
Clone the repository and cd into the directory. Then run the following command.

`$ ruby -I. run_calculator.rb`

*Note: '-I.' in the command is to tell Ruby the required files (requied in run_calculator.rb) are in the current directory.*

**User Inputs**
| Input | Accepted values | Unit |
| ----------- | ----- | ----------- |
| Investment ammount | Positive integers | $ |
| Interest rate | Positive floats | $ |
| Investment term | Positive integers | months |
| Interest payment frequency | 'Monthly', 'Quarterly', 'Annually', 'Maturity' (case insensitive) | time period |

*Note: Any invalid input will result in the user being re-prompted for the same information.*

**The Calculation**
The following compound interest formula is used to calculate the Term Deposit return.
`ending balance = starting balance * (1 * interest_rate_per_period)^n_periods`

**Unit Test**
The unit tests file can be run with the following command. 

`$ ruby -I. calculator_tests.rb`

*Note: Currently there is only coverage for the calculator itself and not the user input functionality. 