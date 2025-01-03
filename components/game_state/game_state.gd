extends Node

@export var players: Array[GamePlayer] = _createPlayers()

static func _createPlayers() -> Array[GamePlayer]:
	var firstPlayerColorIndex = randi_range(0, GameConstants.colors.size() - 1)
	var secondPlayerColorIndex = (firstPlayerColorIndex + 1) % GameConstants.colors.size()

	return [
		GamePlayer.new('First', GameConstants.colors[firstPlayerColorIndex]),
		GamePlayer.new('Second', GameConstants.colors[secondPlayerColorIndex]),
	]
