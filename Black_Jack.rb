class BlackJack
  attr_accessor
  def initialize(player)
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    puts "______ _            _      ___            _    _".colorize(:green)
    puts "| ___ \\ |          | |    |_  |          | |  | |".colorize(:green)
    puts "| |_/ / | __ _  ___| | __   | | __ _  ___| | _| |".colorize(:green)
    puts "| ___ \\ |/ _` |/ __| |/ /   | |/ _` |/ __| |/ / |".colorize(:green)
    puts "| |_/ / | (_| | (__|   </\\__/ / (_| | (__|   <|_|".colorize(:green)
    puts "\\____/|_|\\__,_|\\___|_|\\_\\____/ \\__,_|\\___|_|\\_(_)".colorize(:green)
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    p "You have #{player.wallet.amount} to bet with!"
    p "How much would you like to bet?"
    @bet = gets.strip.to_i
    player.wallet.amount = (player.wallet.amount - @bet)
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
    puts "Your hand: #{hand1[0].rank} + #{hand1[1].rank}\n".colorize(:yellow)
    puts "Dealer showing: #{dealer_hand[0].rank}".colorize(:cyan)
    hitting(player, deck, hand1, dealer_hand)
  end

  def hitting(player, deck, hand1, dealer_hand)
    puts 'Would you like to hit? (Y/N)'.colorize(:cyan)
    case gets.strip.downcase
    when "y"
      hand1 << deck.cards.sample
        hand1.each_with_index do |value, i|
          print "Card #{i + 1}: #{hand1[i].rank} \n".colorize(:yellow)
        end
      hitting(player, deck, hand1, dealer_hand)
    when "n"
      hand1.each_with_index do |value, i|
        print "Card #{i + 1}: #{hand1[i].rank} \n".colorize(:yellow)
      end
      dealer_hand.each_with_index do |value, i|
        print "Deal card #{i + 1}: #{dealer_hand[i].rank} \n".colorize(:cyan)
      end
      final_hands(player, hand1, dealer_hand, deck)
    else
      puts "Invalid input".colorize(:red)
      hitting(player, deck, hand, dealer_hand)
    end
  end


  def ace(e)
    puts 'do you want your ace to equal 11 or 1'.colorize(:cyan)
    case gets.strip.to_i
      when 1
        e = 1
      when 11
        e = 11
      else
        puts 'Invalid option'.colorize(:red)
        ace(e)
    end
  end

  def dealer_ace(player, hand1, deal_rank, deck, dealer_hand)
    deal1_rank = deal_rank.map do |e|
      if e == 0
        begin
        @sum = deal_rank.reduce(:+)
        rescue
          puts "Dealer was caught cheating!"
          puts "Unfortunately its house rules..."
        end
        if (@sum + 11) > 21
          e = 1
        else
          e = 11
        end
      else
        e.to_i
      end
    end
    dealer_hit(player, hand1, deal1_rank, deck, dealer_hand)

  end


  def dealer_hit(player, hand1, deal1_rank, deck, dealer_hand)
    deal2 = []
    deal_rank1 = deal1_rank
    sum2 = deal1_rank.reduce(:+)
    if sum2 < 17
      deal2 << deck.cards.sample
      deal2.each_with_index do |ranks, i|
      puts "Dealer Hit: #{deal2[i].rank}".colorize(:cyan)
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
      dealer_ace(player, hand1, deal_rank1, deck, dealer_hand)
    else
      reveal(player, hand1, deal_rank1)
    end
  end


  def final_hands(player, hand1, dealer_hand, deck)
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
    dealer_ace(player, rank, deal_rank, deck, dealer_hand)
  end

  def reveal(player, rank, deal_rank)
    sum1 = rank.reduce(:+)
    sum2 = deal_rank.reduce(:+)

    puts "The dealer has #{sum2}".colorize(:red)
    puts "You have #{sum1}".colorize(:cyan)

    if sum1 == sum2 && sum1 <= 21
      puts "It was a push".colorize(:yellow)
      player.wallet.amount = (player.wallet.amount + @bet)
      puts "Your have #{player.wallet.amount}".colorize(:yellow)
    elsif sum1 == 21
      puts "Blackjack! Winner Winner Chicken Dinner!".colorize(:green)
      player.wallet.amount = (player.wallet.amount + (@bet * 3))
      puts "Your have #{player.wallet.amount}".colorize(:green)
    elsif sum2 == 21
      puts "Dealer Blackjack. You suck!".colorize(:red)
      puts "Your have #{player.wallet.amount}".colorize(:red)
    elsif sum1 > 21
      puts "You bust! Better luck next time!".colorize(:red)
      puts "Your have #{player.wallet.amount}".colorize(:red)
    elsif sum2 > 21
      puts "Dealer bust! You win!".colorize(:green)
      player.wallet.amount = (player.wallet.amount + (@bet * 2))
      puts "Your have #{player.wallet.amount}".colorize(:green)
    elsif sum1 > sum2
      puts "You're a winner!".colorize(:green)
      player.wallet.amount = (player.wallet.amount + (@bet * 2))
      puts "Your have #{player.wallet.amount}".colorize(:green)
    elsif sum2 > sum1
      puts "You're a looser! Better luck next time.".colorize(:red)
      puts "Your have #{player.wallet.amount}".colorize(:red)
    end

    if player.wallet.amount == 0
      puts "You are broke and need to get a job!".colorize(:color => :blue, :background => :yellow)
      exit
    else
      sub_menu(player)
    end
  end

  def sub_menu(player)
    p '1) GO AGAIN!'
    p '2) Main Menu'
    case gets.strip.to_i
      when 1
        BlackJack.new(player)
      when 2
        RandomAct.new(player)
    end
  end


end
