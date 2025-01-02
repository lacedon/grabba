extends Resource

class_name GamePlayer

@export var name: String
@export var color: Color

func _init(_name: String, _color: Color = Color.TRANSPARENT):
  name = _name
  if _color == Color.TRANSPARENT:
    color = GameConstants.colors[randi_range(0, GameConstants.colors.size() - 1)]
