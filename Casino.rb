require 'pry'
require 'colorize'
require_relative 'Player'
require_relative 'high_low'
require_relative 'Black_Jack'
require_relative 'Dice'
require_relative 'Deck'


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
    p '3) Quit'
   #option to display wallet
    case gets.to_i
    when 1
      HighLow.new(@player)
    when 2
      BlackJack.new(@player)
    when 3
      p 'Thanks for Playing'
      exit
    else
      p 'invalid choice please try again'
    end
    menu
  end
end

Casino.new
