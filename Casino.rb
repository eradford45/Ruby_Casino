require 'pry'
require_relative 'Player'


class Casino
  attr_accessor :player
  def initialize
    p 'Welcome To The Ruby Casino'
    @player = Player.new
    
  end
end

Casino.new