extends Resource
class_name GameArea

@export var name: String
@export var maxBuildingNumber: int
@export var buildings: Array[GameBuilding]

func _init(
  _name: String,
  _maxBuildingNumber: int,
  _buildings: Array[GameBuilding] = [],
) -> void:
  name = _name
  maxBuildingNumber = _maxBuildingNumber
  buildings = _buildings

func _to_string() -> String:
  return '<Area#' + str(self.get_instance_id()) + ':' + name + ';' + str(maxBuildingNumber) + '>'
