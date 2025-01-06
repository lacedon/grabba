extends Resource
class_name GameBuilding

@export var name: String
@export var icon: CompressedTexture2D
@export var effects: Array[GameBuildingEffect]
@export var units: Array[GameUnit] = []

func _init(
	_name: String,
	_icon: CompressedTexture2D,
	_units: Array[GameUnit] = [],
	_effects: Array[GameBuildingEffect] = []
) -> void:
	name = _name
	icon = _icon
	units = _units
	effects = _effects
