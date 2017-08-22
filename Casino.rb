require 'pry'
require 'colorizeç'
require_relative 'Player'
require_relative 'high_low'
require_relative 'Black_Jack'
require_relative 'Dice'
require_relative 'Deck'
require_relative 'Slots'


class Casino
  attr_accessor :player
  def initialize
   
    p 'Welcome To The Ruby Casino'
    @player = Player.new

    menu
  end

  def menu
    p '1) Play High Low'
    p '2) Play Black Jack'
    p '3) Play slots'
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
      p 'Thanks for Playing'
      exit
    else
      p 'invalid choice please try again'
    end
    menu
  end
end

Casino.new
