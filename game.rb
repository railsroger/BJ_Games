require_relative 'money'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'player'

class Game
  attr_accessor :player, :dealer, :deck, :kassa

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @deck = Deck.new
    @kassa = Money.new
  end

  def beginning_game
    restart_game
    2.times { player.hit(@deck) }
    2.times { dealer.hit(@deck) }
    kassa.push(player.rate(10))
    kassa.push(dealer.rate(10))
    player.show_cards
    dealer.show_cards
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

  def total?
    player.total_cards < 3
  end

  def bank?
    player.bank > 0 && dealer.bank > 0
  end

  def open_cards
    puts "#{player.name} cards: #{player.cards * ' '}"
    puts "#{dealer.name} cards: #{dealer.cards * ' '}"
    puts "#{player.name} points is: #{player.points}"
    puts "#{dealer.name} points is: #{dealer.points}"
  end

  def restart_game
    @deck = Deck.new
    player.cards = []
    dealer.cards = []
  end
end
