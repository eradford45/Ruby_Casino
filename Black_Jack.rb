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
    hand1 << deck.cards.sample
    dealer_hand << deck.cards.sample
    hand1 << deck.cards.sample
    dealer_hand << deck.cards.sample
    puts "#{hand1}"
    puts "#{dealer_hand.at(0)}"
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
      puts "#{hand1}"
      puts "#{dealer_hand}"
      final(hand1, dealer_hand)
    else
      puts "Invalid input"
      hitting(hand, dealer_hand)
    end
  end


  def ace(e)
    p 'do you want your ace to equal 11 or 1'
    case gets.strip.to_i
    when 1
      e = 1
    when 11
      e = 11
    else 
      p 'Invalid option'
      ace(e)
    end
  end


  def final(hand1, dealer_hand)
    rank = []
    hand1.each_with_index do |ranks, i|
    rank << hand1[i].rank
    rank = rank.map do |e|
  if e == 'J'
    10
  elsif e == 'K'
    10
  elsif e == 'Q'
    10
  elsif e == 'A'
    ace(e)
  else
    e.to_i
        end
      end
    end

  end
end



