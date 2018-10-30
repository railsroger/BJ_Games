require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'money'

puts 'What is your name?'
player_name = gets.chomp
player = Player.new(player_name, 100)
dealer = Player.new('Dealer', 100)
loop do
  game = Game.new(player, dealer)
  puts "Want to play in Black Jack, Mr. #{player.name}?"
  puts 'Yes - 1, No - 2'
  answer = gets.chomp.to_i
  case answer
  when 1
    break unless player.bank > 0 && dealer.bank > 0
    beginning_game
    play_answer = game_menu
    case play_answer
    when 1
      dealer_turn
    when 2
      player_turn
    when 3
      open_cards
      winner
    end
  when 2
    break
  else
    puts "#{player.name}, want to repeat?"
    puts 'Yes - 1, No - 2'
  end
end
