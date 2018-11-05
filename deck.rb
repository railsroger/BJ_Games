require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = create_cards
  end

  protected

  def create_cards
    cards = []
    Card::SYMBS.each do |symb|
      Card::SUITS.each do |suit|
        cards << Card.new(symb, suit)
      end
    end
    cards.shuffle!
  end
end
