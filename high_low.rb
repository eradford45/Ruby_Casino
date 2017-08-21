class HighLow
  attr_accessor
  def initialize(player)
    p 'Welcome to High Low #{player.name}'
    p "You have #{player.wallet.amount} to bet with!"
    #ask the player to make bet
    # error checking to make player bet with what they have
    # play the game
    #add or subtract from the players wallet after the game
    #allow them to play again or go back to main menu
  end
end