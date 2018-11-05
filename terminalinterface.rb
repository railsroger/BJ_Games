require_relative 'game'
require_relative 'player'

class TerminalInterface
  attr_accessor :player, :dealer, :name
  attr_reader :ti, :kassa, :all

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
        play_answer = game_menu
        case play_answer
        when 1
          ti.dealer_turn
        when 2
          ti.player_turn
        when 3
          ti.open_cards
          ti.winner
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
end
