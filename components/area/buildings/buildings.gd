extends Node2D
class_name AreaBuildingManager

const PolygonHelpers = preload('res://helpers/polygon_helpers.gd')

const BUILDING_ICON_RADIUS: Vector2 = Vector2(48, -24)
const BUILDING_ICON_START_ANGEL: float = 0

@onready var _buildingIconContainer: Node2D = $IconContainer
@onready var _buildingIconPattern: AreaBuildingIcon = $BuildingIconPattern
@onready var _buildingIconHalfSize: Vector2 = _buildingIconPattern.getSize() / 2

func _createBuildingIcon(number: int, centerPosition: Vector2, iconPosition: Vector2 = centerPosition) -> Node2D:
	var icon: Node2D = _buildingIconPattern.duplicate()
	icon.name = 'BuildingIcon:' + str(number)
	icon.position = iconPosition - _buildingIconHalfSize
	icon.show()
	return icon

func setBuildingIcons(centerPosition: Vector2, buildingNumber: int):
	if buildingNumber == 0:
		return

	if buildingNumber == 1:
		_buildingIconContainer.add_child(_createBuildingIcon(1, centerPosition))

	var angle: float = PI / (buildingNumber - 1)
	for buildingIndex in range(buildingNumber):
		var icon: Node2D = _createBuildingIcon(
			buildingIndex + 1,
			centerPosition,
			PolygonHelpers.calcPointAroundCircle(centerPosition, BUILDING_ICON_RADIUS, BUILDING_ICON_START_ANGEL + angle * buildingIndex)
		)
		_buildingIconContainer.add_child(icon)

func _ready() -> void:
	_buildingIconPattern.hide()
