require_relative 'wallet'
class Player
  attr_accessor :name, :age, :wallet
  def initialize
    puts '                           __  __________   ____  __                      
                          /  |/  / ____/ | / / / / /                      
 ________________________/ /|_/ / __/ /  |/ / / / /_______________________
/_____/_____/_____/_____/ /  / / /___/ /|  / /_/ /_____/_____/_____/_____/
                       /_/  /_/_____/_/ |_/\____/                         
                                                                          '.colorize(:red)
    puts 'What is your name?'.colorize(:yellow)
    @name = gets.strip
    puts "What is your age #{name}".colorize(:blue)
    @age = gets.to_i
    puts "How much money are you playing with #{name}?".colorize(:yellow)
    @wallet = Wallet.new(gets.to_f)
  end
end