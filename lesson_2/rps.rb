VALID_CHOICES = ['rock', 'paper', 'scissors']
def display_results(choice, computer_choice)
  if (choice == 'rock' && computer_choice == 'scissors') ||
     (choice == 'paper' && computer_choice == 'rock') ||
     (choice == 'scissors' && computer_choice == 'paper')
    prompt("You won!")
  elsif choice == computer_choice
    prompt("Its a tie!")
  else
    prompt("You Lost!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one:#{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Thats not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Would you like to play again? Y/N")
  answer = Kernel.gets().chomp().downcase()
  break unless answer.start_with?('y')
end
prompt("Thank you for playing, Goodbye")
