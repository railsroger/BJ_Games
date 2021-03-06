require_relative 'hand'

class Player
  attr_accessor :cards, :name, :bank
  include Hand

  def initialize(name, bank)
    @name = name
    @bank = bank
    @cards = []
  end

  def rate(rate)
    @bank -= rate
  end

  def win(rate)
    @bank += rate
  end

  def total_cards
    cards.size
  end

  def player_cards
    if name != 'Dealer'
      "Player: #{name} cards: #{cards * ' '}"
    else
      "Player: #{name} cards: #{cards.collect { |_card| _card = '*' } * ' '}"
    end
  end
end
