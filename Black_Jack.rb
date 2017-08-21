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
      final_hands(hand1, dealer_hand, deck)
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

  def dealer_ace(hand1, deal_rank, deck, dealer_hand)
    deal1_rank = deal_rank.map do |e|
      if e == 0
        @sum = deal_rank.reduce(:+)
        if (@sum + 11) > 21
          e = 1
        else
          e = 11
        end
      else
        e.to_i
      end
    end
    dealer_hit(hand1, deal1_rank, deck, dealer_hand)
    
  end


  def dealer_hit(hand1, deal1_rank, deck, dealer_hand)
    deal2 = []
    deal_rank1 = deal1_rank
    sum2 = deal1_rank.reduce(:+)
    if sum2 < 17
      deal2 << deck.cards.sample
      deal2.each_with_index do |ranks, i|
    deal_rank1 << dealer_hand[i].rank
      deal_rank = deal_rank1.map do |e|
        if e == 'J'
          10
        elsif e == 'K'
          10
        elsif e == 'Q'
          10
        elsif e == 'A'
          0
        else
          e.to_i
        end

      end
    end
    dealer_ace(hand1, deal_rank1, deck, dealer_hand)
    else
    reveal(hand1, deal_rank1)
    
    end
  end


  def final_hands(hand1, dealer_hand, deck)
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

    deal_rank = []
    dealer_hand.each_with_index do |ranks, i|
    deal_rank << dealer_hand[i].rank
      deal_rank = deal_rank.map do |e|
        if e == 'J'
          10
        elsif e == 'K'
          10
        elsif e == 'Q'
          10
        elsif e == 'A'
          0
        else
          e.to_i
        end
      end
    end
    dealer_ace(rank, deal_rank, deck, dealer_hand)
  end

  def reveal(rank, deal_rank)
    sum1 = rank.reduce(:+)
    sum2 = deal_rank.reduce(:+)

    puts "The dealer has #{sum2}"
    puts "You have #{sum1}"

    if sum1 > 21
      puts "You bust! Better luck next time!"
    elsif sum2 > 21
      puts "Dealer bust! You win?"
    elsif sum1 > sum2
      puts "You're a winner!"
    elsif sum2 > sum1
      puts "You're a looser! Better luck next time."
    else
      puts "It was a push"
    end
  end





end
