extends Node2D
class_name AreaBuildingManager

const PolygonHelpers = preload('res://helpers/polygon_helpers.gd')

const BUILDING_ICON_RADIUS: Vector2 = Vector2(48, -24)
const BUILDING_ICON_START_ANGEL: float = 0

@onready var _buildingIconContainer: Node2D = $IconContainer
@onready var _buildingIconPattern: AreaBuildingIcon = $BuildingIconPattern
@onready var _buildingIconHalfSize: Vector2 = _buildingIconPattern.getSize() / 2

var area: GameArea

func _createBuildingIcon(number: int, centerPosition: Vector2, iconPosition: Vector2 = centerPosition) -> Node2D:
	var icon: Node2D = _buildingIconPattern.duplicate()
	icon.name = 'BuildingIcon:' + str(number)
	icon.position = iconPosition - _buildingIconHalfSize
	icon.show()
	return icon

func createIcons(centerPosition: Vector2, maxBuildingNumber: int) -> void:
	if maxBuildingNumber == 0:
		return

	if maxBuildingNumber == 1:
		_buildingIconContainer.add_child(_createBuildingIcon(1, centerPosition))

	var angle: float = PI / (maxBuildingNumber - 1)
	for buildingIndex in range(maxBuildingNumber):
		var icon: Node2D = _createBuildingIcon(
			buildingIndex + 1,
			centerPosition,
			PolygonHelpers.calcPointAroundCircle(centerPosition, BUILDING_ICON_RADIUS, BUILDING_ICON_START_ANGEL + angle * buildingIndex)
		)
		_buildingIconContainer.add_child(icon)

func init(localArea: GameArea, centerPosition: Vector2) -> void:
	area = localArea

	createIcons(centerPosition, localArea.maxBuildingNumber)

func setBuildingIcon(index: int, building: GameBuilding) -> void:
	var buildingIcon: AreaBuildingIcon = _buildingIconContainer.get_child(index)
	buildingIcon.init(building)

func setBuilding(index: int, building: GameBuilding) -> void:
	if area.buildings[index] != null:
		prints('[WARN] Cannot build ' + building.name + ' in ' + area.name + '[' + str(index) + ']: Building place is already set')
		return

	# TODO: Need to put an instance copy here
	area.buildings[index] = building
	setBuildingIcon(index, building)

func handleBuilding(localArea: GameArea, buildingIndex: int, building: GameBuilding) -> void:
	if area != localArea:
		return

	if area.maxBuildingNumber <= buildingIndex:
		prints('[WARN] Cannot build ' + building.name + ' in ' + area.name + '[' + str(buildingIndex) + ']: Index is out of maxBuildingNumber')
		return

	setBuilding(buildingIndex, building)

func _ready() -> void:
	_buildingIconPattern.hide()

	EventEmitter.AddListener(GameUIBuildingItem.signal_build, self, handleBuilding)

func _exit_tree() -> void:
	EventEmitter.RemoveListener(GameUIBuildingItem.signal_build, self, handleBuilding)
