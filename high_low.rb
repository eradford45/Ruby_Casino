require_relative 'Dice'

class HighLow
  attr_accessor
  def initialize(player)
    p "Welcome to High Low #{player.name}"
    p "You have #{player.wallet.amount} to bet with!"
    #initial roll
    d = Dice.new
    d.show_sum
    num1 = d.sum_of_dice
    #ask the player to make bet
    p "How much would you like to bet?"
    bet = gets.strip.to_f
    p "Will the next roll be higher or lower?"
    choice = gets.strip
    case choice
      when "higher"
        higher(num1)
      when "lower"
        lower(num1)
      else
        "Speak clearly"
    end
  end

  def higher(first_roll)
    d2 = Dice.new
    d2.show_sum
    num2 = d2.sum_of_dice
    if num2 > first_roll
      p 'You are a Winner!'
    else
      p 'That sucks. Gimme my money!'
    end
  end

  def lower(first_roll)
    d2 = Dice.new
    d2.show_sum
    num2 = d2.sum_of_dice
    if d2 < first_roll
      p 'You are a Winner!'
    else
      p 'That sucks. Gimme my money!'
    end
  end
    # error checking to make player bet with what they have
    # play the game
    #add or subtract from the players wallet after the game
    #allow them to play again or go back to main menu
end
