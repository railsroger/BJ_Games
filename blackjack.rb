require_relative 'terminalinterface'

player = Player.new('Maksim')
dealer = Player.new('LA Casino')
game = Game.new(player, dealer)
ti = TerminalInterface.new(game)
ti.start_game
