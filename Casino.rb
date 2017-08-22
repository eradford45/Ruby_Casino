require 'pry'
require 'colorize'
require_relative 'Player'
require_relative 'high_low'
require_relative 'Black_Jack'
require_relative 'Dice'
require_relative 'Deck'
require_relative 'Slots'
require_relative 'Random_act'


class Casino
  attr_accessor :player
  def initialize
    puts '                                                          '.colorize(:background => :yellow)
    puts '                                                          '.colorize(:background => :red)
    puts '                                                          '.colorize(:background => :green)
    puts " _       __________    __________  __  _______________ "
    puts "| |     / / ____/ /   / ____/ __ \\/  |/  / ____/ / / /"
    puts "| | /| / / __/ / /   / /   / / / / /|_/ / __/ / / / / "
    puts "| |/ |/ / /___/ /___/ /___/ /_/ / /  / / /___/_/_/_/  "
    puts "|__/|__/_____/_____/\\____/\\____/_/  /_/_____(_|_|_)   "
    puts '                                                          '.colorize(:background => :green)
    puts '                                                          '.colorize(:background => :red)
    puts '                                                          '.colorize(:background => :yellow)
    @player = Player.new

    menu
  end

  def menu
    p '1) Play High Low'
    p '2) Play Black Jack'
    p '3) Play Slots'
    p '4) View Wallet'
    p '5) Quit'
    case gets.to_i
    when 1
      HighLow.new(@player)
    when 2
      BlackJack.new(@player)
    when 3
      Slots.new(@player)
    when 4
      p "#{@player.wallet.amount}"
    when 5
      puts 'Thanks for Playing'.colorize(:yellow)
      exit
    else
      p 'invalid choice please try again'
    end
    menu
  end
end

Casino.new
