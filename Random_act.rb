class RandomAct
  def initialize(player)
    random_act = [
      "You were mugged while in the bathroom. You loose $50!",
      "You went to get a loan from a loan shark at the back of the casino. It was a scam...you lose $50",
      "You find $50 dollars laying under the game table when you leave.",
      "Someone slipped something in your drink. You wake up two days later with $500 more than when you started.",
      "You decide to see a show, and accidentally bought fake tickes. You lose $100"
    ]
    what_happens = random_act.sample
    puts "#{what_happens}".colorize(:yellow)
    case
      when what_happens == random_act[0]
        player.wallet.amount = (player.wallet.amount - 50)
        puts "You now have: $#{player.wallet.amount}.".colorize(:yellow)
      when what_happens == random_act[1]
        player.wallet.amount = (player.wallet.amount - 50)
        puts "You now have: $#{player.wallet.amount}.".colorize(:yellow)
      when what_happens == random_act[2]
        player.wallet.amount = (player.wallet.amount + 50)
        puts "You now have: $#{player.wallet.amount}.".colorize(:yellow)
      when what_happens == random_act[3]
        player.wallet.amount = (player.wallet.amount + 500)
        puts "You now have: $#{player.wallet.amount}.".colorize(:yellow)
      when what_happens == random_act[4]
        player.wallet.amount = (player.wallet.amount - 100)
        puts "You now have: $#{player.wallet.amount}.".colorize(:yellow)
    end
  end
end
