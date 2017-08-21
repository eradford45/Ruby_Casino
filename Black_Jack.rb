class BlackJack
  attr_accessor
  def initialize(player)
    p "Welcome to Black Jack #{player.name}"
    p "You have #{player.wallet.amount} to bet with!"
    p "How much would you like to bet?"
    bet = gets.strip.to_f
    player.wallet.amount = (player.wallet.amount - bet)
    deal(player)
  end

  def deal(player)
    deck = Deck.new
    deck.shuffle_cards
    hand1 = []
    dealer_hand = []
    hand1 << deck.cards.sample(2)
    dealer_hand << deck.cards.sample(1)
    puts "#{hand1}"
    puts "#{dealer_hand}"
    hitting(deck, hand1, dealer_hand)
  end

  def hitting(deck, hand1, dealer_hand)
    puts 'Would you like to hit? (Y/N)'
    case gets.strip.downcase
    when "y"
      hand1 << deck.cards.sample
      puts "#{hand1}"
      hitting(deck, hand1, dealer_hand)
    when "n"
      dealer_hand << deck.cards.sample
      puts "#{hand1}"
      puts "#{dealer_hand}"
    else
      puts "Invalid input"
      hitting(hand, dealer_hand)
    end

  end
end
