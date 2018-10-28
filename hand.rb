module Hand

  def points
    points = 0

    cards.each do |card|
      points += 10 if card.value == 'A'
                   elsif card.value.to_i.zero?
                     10
                   else
                     card.value.to_i
                   end
    end
    cards.select { |card| card.value == 'A' }.count.times do
      points -= 10 if points > 21
    end
    points
  end

  def hit(deck)
    @cards << deck.cards.pop
  end

  def the_end?
    points > 21
  end

  def you_win?
    points == 21
  end
end
