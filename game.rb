require_relative 'player'
require_relative 'money'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'

class Game
  attr_accessor :player, :dealer, :deck, :kassa

  def initialize(player, game)
    @player = player
    @dealer = dealer
    @kassa = Money.new
    @deck = Deck.new
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
end
