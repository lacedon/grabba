extends GameBuildingEffect
class_name GameBuildingEffectUnitCreation

@export var unit: Array[GameUnit]
@export var maxUnitNumber: int

func _init(
  _name: String,
  _unit: Array[GameUnit],
  _maxUnitNumber: int
):
  name = _name
  unit = _unit
  maxUnitNumber = _maxUnitNumber
