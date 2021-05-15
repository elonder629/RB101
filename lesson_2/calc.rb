# ask the user for two numnbers
# ask the user for an operator
# perform the operation on the two numnbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num = num.split(//)
  test = nil
  (0..9).each do |i|
    test = true if num[0].include? i.to_s
  end
  test
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

num1 = nil
prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end
end

loop do # main loop
  prompt("Hi #{name}")
  loop do
    prompt("What's the first number?")
    num1 = Kernel.gets().chomp()

    if valid_number?(num1)
      break
    else
      prompt("That isnt a valid number")
    end
  end
  num2 = nil
  loop do
    prompt("What's the second number?")
    num2 = Kernel.gets().chomp()

    if valid_number?(num2)
      break
    else
      prompt("That isnt a valid number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1,2,3 or 4")
    end
  end

  results = case operator
            when '1'
              num1.to_i() + num2.to_i()
            when '2'
              num1.to_i() - num2.to_i()
            when '3'
              num1.to_i() * num2.to_i()
            when '4'
              num1.to_f() / num2.to_f()
            end

  prompt("#{operation_to_message(operator)} the two numbers ....")
  prompt("The result is #{results}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Calculator")
