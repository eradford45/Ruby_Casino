class Slots
  attr_accessor
  def initialize(player)
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    puts "           ____  _     ___ _____ ____ ".colorize(:green)
    puts "          / ___|| |   / _ \\_   _/ ___|".colorize(:green)
    puts "          \\___ \\| |  | | | || |\\___ \\".colorize(:green)
    puts "           ___) | |__| |_| || | ___)  |".colorize(:green)
    puts "          |____/|_____\\___/ |_| |____/ ".colorize(:green)
    puts "__________________________________________________".colorize(:color => :light_blue, :background => :red)
    p "You have #{player.wallet.amount}".colorize(:yellow)
    p "How much would you like to bet?".colorize(:yellow)
    @bet = gets.strip.to_i
    player.wallet.amount -= @bet
    pull_lever(player)
  end


  def win(player)
    puts 'Winner'.colorize(:green)
    puts "You won #{@bet * 3}".colorize(:green)
    player.wallet.amount += (@bet * 3)
    puts "You now have #{player.wallet.amount}".colorize(:green)
  end


  def win2(player)
    puts 'Winner'.colorize(:green)
    puts "You won #{@bet * 2}".colorize(:green)
    player.wallet.amount += (@bet * 2)
    puts "You now have #{player.wallet.amount}".colorize(:green)
  end

  def pull_lever(player)
  options = ['!', '@', '#', '$', '%', '^', '&', '*', 'A', 'J', 'Z', 'Q']
  opt1 = options.sample
  opt2 = options.sample
  opt3 = options.sample
  opt4 = options.sample
  opt5 = options.sample
  opt6 = options.sample
  opt7 = options.sample
  opt8 = options.sample
  opt9 = options.sample
  p "#{opt1} #{opt2} #{opt3}"
  p "#{opt4} #{opt5} #{opt6}"
  p "#{opt7} #{opt8} #{opt9}"
  case
    when (opt1 == opt2) && (opt2 == opt3)
      win(player)
    when (opt1 == opt5) && (opt1 == opt9)
     win(player)
    when (opt1 == opt4) && (opt7 == opt1)
      win(player)
    when (opt2 == opt5) && (opt8 == opt2)
      win(player)
    when (opt3 == opt5) && (opt7 == opt3)
      win(player)
    when (opt3 == opt6) && (opt9 == opt3)
      win(player)
    when (opt4 == opt5) && (opt6 == opt4)
      win(player)
    when (opt7 == opt8) && (opt9 == opt7)
      win(player)
    when opt1 == opt2
      win2(player)
    when opt1 == opt4
      win2(player)
    when opt2 == opt3
      win2(player)
    when opt3 == opt6
      win2(player)
    when opt4 == opt5
      win2(player)
    when opt4 == opt7
      win2(player)
    when opt5 == opt6
      win2(player)
    when opt5 == opt8
      win2(player)
    when opt6 == opt9
      win2(player)
    when opt7 == opt8
      win2(player)
    when opt8 == opt9
      win2(player)
    else
      puts 'You Lose'.colorize(:red)
      puts "You lost #{@bet}".colorize(:red)
      puts "You now have #{player.wallet.amount}".colorize(:red)

    end
    p '1) GO AGAIN!'.colorize(:yellow)
    p '2) Main Menu'.colorize(:red)
    case gets.strip.to_i
      when 1
        Slots.new(player)
      when 2
        RandomAct.new(player)
    end
  end
end
