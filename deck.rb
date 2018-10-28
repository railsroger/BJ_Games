require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = create_cards
  end

  protected

  def create_cards
    cards = []
    %w(+ <3 ^ <>).each do |suit|
      (2..10).each do |number|
        cards << Card.new(suit, number)
      end
      %w(A K Q J).each do |namecard|
        cards << Card.new(suit, namecard)
      end
    end
    cards.shuffle!
  end
end
