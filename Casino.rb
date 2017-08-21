require 'pry'
require_relative 'Player'
require_relative 'high_low'


class Casino
  attr_accessor :player
  def initialize
    p 'Welcome To The Ruby Casino'
    @player = Player.new
    menu
  end


  def menu
    p '1) Play High Low'
    p '2) Quit'
   
    case gets.to_i
    when 1
      HighLow.new(@player)
    when 2
      p 'Thanks for Playing'
      exit  
    else 
      p 'invalid choice please try again'
    end
    menu
  end
end

Casino.new