require_relative 'player'
class Card

  SYMBS = %w{+ <3 ^ <>}
  SUITS = %w{2 3 4 5 6 7 8 9 10 A K Q J}

  attr_reader :suit, :value, :name, :cards

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{@value} - #{@suit}"
  end
end
