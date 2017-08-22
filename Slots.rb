class Slots
  attr_accessor
  def initialize(player)
    puts 'Welcome to the Slot machines'.colorize(:cyan)
    puts "You have #{player.wallet.amount}".colorize(:yellow)
    puts "How much would you like to bet".colorize(:yellow)
    @bet = gets.strip.to_i
    player.wallet.amount -= @bet
    pull_lever(player)  
  end


  def win(player)
    puts 'Winner'.colorize(:yellow)
    puts "You won #{@bet * 3}".colorize(:yellow)
    player.wallet.amount += (@bet * 3)
    puts "You now have #{player.wallet.amount}".colorize(:magenta)
  end


  def win2(player)
    puts 'Winner'.colorize(:yellow)
    puts "You won #{@bet * 2}".colorize(:yellow)
    player.wallet.amount += (@bet * 2)
    puts "You now have #{player.wallet.amount}".colorize(:magenta)
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
  puts "#{opt1} #{opt2} #{opt3}".colorize(:yellow)
  puts "#{opt4} #{opt5} #{opt6}".colorize(:blue)
  puts "#{opt7} #{opt8} #{opt9}".colorize(:yellow
  
  )
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
     puts '                           __  __________   ____  __                      
                          /  |/  / ____/ | / / / / /                      
 ________________________/ /|_/ / __/ /  |/ / / / /_______________________
/_____/_____/_____/_____/ /  / / /___/ /|  / /_/ /_____/_____/_____/_____/
                       /_/  /_/_____/_/ |_/\____/                         
                                                                          '.colorize(:red)
    puts '1) GO AGAIN!'.colorize(:yellow)
    puts '2) Main Menu'.colorize(:yellow)
    case gets.strip.to_i
    when 1
    Slots.new(player)
    when 2

    end
  end
end