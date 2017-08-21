require_relative 'wallet'
class Player
  attr_accessor :name, :age, :wallet
  def initialize
    p 'What is your name?'
    @name = gets.strip
    p "What is your age #{name}"
    @age = gets.to_i
    p "How much money are you playing with #{name}?"
    @wallet = Wallet.new(gets.to_f)
  end
end