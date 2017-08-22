require 'pry'


require 'colorize'

require_relative 'Player'
require_relative 'high_low'
require_relative 'Black_Jack'
require_relative 'Dice'
require_relative 'Deck'
require_relative 'Slots'


class Casino
  attr_accessor :player
  def initialize
   
    puts 'Welcome To The Ruby Casino'.colorize(:light_blue)
    @player = Player.new

    menu
  end

  def menu
    puts '                           __  __________   ____  __                      
                          /  |/  / ____/ | / / / / /                      
 ________________________/ /|_/ / __/ /  |/ / / / /_______________________
/_____/_____/_____/_____/ /  / / /___/ /|  / /_/ /_____/_____/_____/_____/
                       /_/  /_/_____/_/ |_/\____/                         
                                                                          '.colorize(:red)
    puts '1) Play High Low'.colorize(:blue)
    puts '2) Play Black Jack'.colorize(:yellow)
    puts '3) Play slots'.colorize(:blue)
    puts '4) View Wallet'.colorize(:yellow)
    puts '5) Quit'.colorize(:red)
    case gets.to_i
    when 1
      HighLow.new(@player)
    when 2
      BlackJack.new(@player)
    when 3
      Slots.new(@player)
    when 4
      puts "#{@player.wallet.amount}"
    when 5
      puts 'Thanks for Playing'.colorize(:blue)
      exit
    else
      puts 'invalid choice please try again'.colorize(:red)
    end
    menu
  end
end

Casino.new
