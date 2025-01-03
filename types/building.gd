extends Resource
class_name GameBuilding

@export var name: String
@export var icon: CompressedTexture2D
@export var effects: Array[GameBuildingEffect]

func _init(
	_name: String,
	_icon: CompressedTexture2D,
	_effects: Array[GameBuildingEffect] = []
) -> void:
	name = _name
	icon = _icon
	effects = _effects
