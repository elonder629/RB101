VALID_CHOICES = {'rock' => 'r',
                 'paper' => 'p',
                 'scissors' => 's',
                 'lizard' => 'l',
                 'spock' => 'sp'}
WIN_TABLE = {rock: ['scissors','lizard'],
             paper: ['rock','spock'],
             scissors: ['paper','lizard'],
             lizard: ['spock','paper'],
             spock: ['scissors', 'rock']}
player_wins = 0
computer_wins = 0
def win?(choice, computer_choice)
  results = 0
  if WIN_TABLE[choice.to_sym].include?(computer_choice)
    results = 0
  elsif choice == computer_choice
    results = 1
  else
    results = 2
  end
  return results
end
def display_results(result)
  case result
  when 0
    prompt("You Won!")
  when 1
    prompt("Its a Tie")
  when 2
    prompt("You Lose")
  end
end
def display_score(player_wins, computer_wins)
  prompt("Player: #{player_wins}|Computer: #{computer_wins}")
end
def prompt(message)
  puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one:")
    VALID_CHOICES.each {|full, abrv| puts "#{full}(#{abrv})"}
    choice = gets().chomp()
    if VALID_CHOICES.has_value?(choice)
      choice = VALID_CHOICES.key(choice)
      break
    elsif VALID_CHOICES.has_key?(choice)
      break
    else
      prompt("Thats not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")
  results = win?(choice, computer_choice)
  display_results(results)
  if results == 0
    player_wins += 1
  elsif results == 2
    computer_wins += 1
  end
  display_score(player_wins,computer_wins)
  break if player_wins == 3 || computer_wins == 3
  prompt("Would you like to play again? Y/N")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end


prompt("Thank you for playing, Goodbye")
