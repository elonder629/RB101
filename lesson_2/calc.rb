# ask the user for two numnbers
# ask the user for an operator
# perform the operation on the two numnbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to Calculator")

Kernel.puts("What's the first number?")
num1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
num2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  results = num1.to_i() + num2.to_i()
elsif operator == '2'
  results = num1.to_i() - num2.to_i()
elsif operator == '3'
  results = num1.to_i() * num2.to_i()
else
  results = num1.to_f() / num2.to_f()
end

Kernel.puts("The result is #{results}")
