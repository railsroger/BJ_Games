class Palayer
  attr_accessor :cards, :name, :bank

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

  def show_cards
    if name != 'Dealer'
      puts "Player: #{name} cards: #{cards * ' '}"
    else
      puts "Player: #{name} cards: #{cards.collect { |_card| _card = '*' } * ' '}"
    end
  end
end
