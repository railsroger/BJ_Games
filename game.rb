require_relative 'money'
require_relative 'deck'
require_relative 'player'
require_relative 'card'

class Game
  attr_accessor :player, :dealer, :deck, :kassa

  def initialize
    @kassa = Money.new
    @deck = Deck.new
    @player = Player.new('Player', 100)
    @dealer = Player.new('Dealer', 100)
  end

  def start_game
    puts 'What is your name?'
    player.name = gets.chomp

    loop do
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
  end

  private

  def beginning_game
    restart_game
    2.times { player.hit(@deck) }
    2.times { dealer.hit(@deck) }
    kassa.push(player.rate(10))
    kassa.push(dealer.rate(10))
    player.show_cards
    dealer.show_cards
  end

  def game_menu
    puts 'Make a choice'
    puts '1 - Skip'
    puts '2 - Add card' if player.total_cards < 3
    puts '3 - Show cards'
    gets.chomp.to_i
  end

  def player_turn
    player.hit(@deck) if player.total_cards < 3
    open_cards
    winner
  end

  def dealer_turn
    dealer.hit(@deck) if dealer.points <= 18 && dealer.total_cards < 3
    open_cards
    winner
  end

  def open_cards
    puts "#{player.name} cards: #{player.cards * ' '}"
    puts "#{dealer.name} cards: #{dealer.cards * ' '}"
    puts "#{player.name} points is: #{player.points}"
    puts "#{dealer.name} points is: #{dealer.points}"
  end

  def winner
    if dealer.the_end? || player.you_win?
      puts "Congrats, #{player.name} - You Win!"
      dealer.win(kassa.all)
    elsif player.the_end? || dealer.you_win?
      puts 'You lose!'
      player.win(kassa.all)
    else
      puts 'Repeat please.'
      a = kassa.all / 2
      player.win(a)
      dealer.win(a)
    end
  end

  def restart_game
    @deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  game = Game.new
  game.start_game
end
