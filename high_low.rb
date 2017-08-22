require_relative 'Dice'

class HighLow
  attr_accessor
  def initialize(player)
    puts "Welcome to High Low #{player.name}".colorize(:magenta)
    puts "You have #{player.wallet.amount} to bet with!".colorize(:yellow)
    #initial roll
    d = Dice.new
    d.show_sum
    num1 = d.sum_of_dice
    #ask the player to make bet
    puts "How much would you like to bet?".colorize(:yellow)
    bet = gets.strip.to_f
    player.wallet.amount = (player.wallet.amount - bet)

    puts "Will the next roll be higher or lower?".colorize(:magenta)
    choice = gets.strip
    case choice
      when "higher"
        higher(num1, bet, player)
      when "lower"
        lower(num1, bet, player)
      else
        puts "Speak clearly".colorize(:red)
    end
  end

  def higher(first_roll, bet, player)
    d2 = Dice.new
    d2.show_sum
    num2 = d2.sum_of_dice
    if num2 > first_roll
      puts 'You are a Winner!'.colorize(:yellow)
      winnings = (bet * 2)
    player.wallet.amount = (player.wallet.amount + winnings)
      puts "You won #{winnings}".colorize(:yellow)
      puts "Your wallet now has #{player.wallet.amount}".colorize(:yellow)
    else
      puts 'That sucks. Gimme my money!'.colorize(:red)
    end
  end

  def lower(first_roll, bet, player)
    d2 = Dice.new
    d2.show_sum
    num2 = d2.sum_of_dice
    if num2 < first_roll
      puts 'You are a Winner!'.colorize(:yellow)
      winnings = (bet * 2)
    player.wallet.amount = (player.wallet.amount + winnings)
      puts "You won #{winnings}".colorize(:yellow)
      puts "Your wallet now has #{player.wallet.amount}"
    else
      puts 'That sucks. Gimme my money!'.colorize(:red)
    end
  end
end
