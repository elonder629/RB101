def prompt(message)
  Kernel.puts("=> #{message}")
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def int?(input)
  /^-?\d+$/.match(input)
end

def valid?(input)
  if float?(input) && input.to_f > 0
    input.to_f
  elsif int?(input) && input.to_i > 0
    input.to_i
  else
    false
  end
end

def loan_formula(p, n, j)
  (p * (j / (1 - (1 + j)**(-n)))).round(2)
end

name = ''
loop do
  prompt("Please enter a name")
  name = gets.chomp

  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end
end

loop do # main loop
  prompt("Hello there #{name}")
  loan_ammount = nil
  loop do
    prompt("What is the total loan ammount?")
    loan_ammount = valid?(gets.chomp)
    if loan_ammount
      break
    else
      prompt("Please enter a valid number")
    end
  end
  loan_duration = nil
  loop do
    prompt("What is the total loan duration in months")
    loan_duration = valid?(gets.chomp)
    if loan_duration
      break
    else
      prompt("Please enter a valid number")
    end
  end
  apr = nil
  loop do
    prompt("What is the APR as a percentage")
    apr = valid?(gets.chomp)
    if apr
      break
    else
      prompt("Please enter a valid number")
    end
  end
  monthly_interest_rate = (apr / 100) / 12
  monthly_payment = loan_formula(loan_ammount,
                                 loan_duration,
                                 monthly_interest_rate)

  prompt("Your monthy monthly payment will be #{monthly_payment} Dollars")
  prompt("Would you like to make another Calculation? Enter Y")
  input = gets.chomp.downcase
  break unless input == 'y'
end
