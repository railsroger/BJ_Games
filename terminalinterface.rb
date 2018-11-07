require_relative 'game'
require_relative 'player'

class TerminalInterface
  attr_accessor :name
  attr_reader :ti, :player, :dealer, :kassa, :all, :winner, :lose, :repeat, :open_cards, :show_cards, :cards

  def initialize(ti)
    @ti = ti
  end

  def start_game
    puts 'What is your name?'
    ti.player.name = gets.chomp
     loop do
      puts "Want to play in Black Jack, Mr. #{ti.player.name}?"
      puts 'Yes - 1, No - 2'
      answer = gets.chomp.to_i
      case answer
      when 1
        break unless ti.bank?
        ti.beginning_game
        puts ti.player.player_cards
        puts ti.dealer.player_cards
        play_answer = game_menu
        case play_answer
        when 1
          ti.dealer_turn
          open_cards
          congrats
        when 2
          ti.player_turn
          open_cards
          congrats
        when 3
          open_cards
          congrats
        end
      when 2
        break
      else
        puts "#{ti.player.name}, want to repeat?"
        puts 'Yes - 1, No - 2'
      end
    end
  end

  def game_menu
    puts 'Make a choice'
    puts '1 - Skip'
    puts '2 - Add card' if ti.total?
    puts '3 - Show cards'
    gets.chomp.to_i
  end

  def congrats
    if ti.winner?
      puts "Congrats, #{ti.player.name} - You Win!"
    elsif ti.lose?
      puts 'You lose!'
    else
      puts 'Repeat please.'
    end
  end

  def open_cards
    puts "#{ti.player.name} cards: #{ti.player.cards * ' '}"
    puts "#{ti.dealer.name} cards: #{ti.dealer.cards * ' '}"
    puts "#{ti.player.name} points is: #{ti.player.points}"
    puts "#{ti.dealer.name} points is: #{ti.dealer.points}"
  end
end
