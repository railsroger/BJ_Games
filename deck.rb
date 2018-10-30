require_relative 'card'

SYMB = %w{+ <3 ^ <>}
SUITS = %w{A K Q J}

class Deck
  attr_reader :cards

  def initialize
    @cards = create_cards
  end

  protected

  def create_cards
    cards = []
    SYMB.each do |suit|
      (2..10).each do |number|
        cards << Card.new(suit, number)
      end
      SUITS.each do |namecard|
        cards << Card.new(suit, namecard)
      end
    end
    cards.shuffle!
  end
end
