require_relative 'terminalinterface'

player = Player.new('Maksim', 100)
dealer = Player.new('Dealer', 100)
game = Game.new(player, dealer)
ti = TerminalInterface.new(game)
ti.start_game
