require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end
  def print_matches(guess)
    puts @secret_code.num_exact_matches(guess)
    puts @secret_code.num_near_matches(guess)
  end
  def ask_user_for_guess
    puts "Enter a code"
    input_from_user = gets.chomp
    guessed = Code.from_string(input_from_user)
    self.print_matches(guessed)
    guessed == @secret_code
  end
end
