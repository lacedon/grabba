extends Node2D

const AreaResource = preload("res://types/area_resource.gd")
const PolygonHelpers = preload('res://helpers/polygon_helpers.gd')

const DEFAULT_COLOR: Color = Color(1, 1, 1, 0.15)
const BORDER_SIZE: int = 4
const BUILDING_ICON_RADIUS: int = 24
const BUILDING_ICON_START_ANGEL: float = 0

@export var ownerPlayerIndex: int = -1
@export var buildingNumber: int = 0
@export var resources: Array[AreaResource] = []

@onready var _visualBodyPolygon: Polygon2D = $VisualBody
@onready var _borderPolygon: Polygon2D = $BorderPolygon
@onready var _buildingIconPattern: Node2D = $BuildingIconPattern
@onready var _buildingIconContainer: Node2D = $BuildingContainer
@onready var _buildingIconPatternCenter: = PolygonHelpers.calcPolygonCenter(_buildingIconPattern)

var _center: Vector2 = Vector2.ZERO

func setOwnerColor():
	if ownerPlayerIndex >= 0 && ownerPlayerIndex < GameState.players.size():
		_visualBodyPolygon.color = GameState.players[ownerPlayerIndex].color
	else:
		_visualBodyPolygon.color = DEFAULT_COLOR

func setUpBorder():
	_borderPolygon.polygon = Geometry2D.offset_polygon(_visualBodyPolygon.polygon, -BORDER_SIZE)[0]
	_borderPolygon.invert_border = BORDER_SIZE

func _createBuildingIcon(number: int, iconPosition: Vector2) -> Node2D:
	var icon: Node2D = _buildingIconPattern.duplicate()
	icon.name = 'BuildingIcon:' + str(number)
	icon.position = iconPosition - _buildingIconPatternCenter / 2
	icon.show()
	return icon

func setBuildingIcons():
	if buildingNumber == 0:
		return

	if buildingNumber == 1:
		_buildingIconContainer.add_child(_createBuildingIcon(1, _center))

	var angle = PI / (buildingNumber - 1)
	for buildingIndex in range(buildingNumber):
		var icon: Node2D = _createBuildingIcon(
			buildingIndex + 1,
			PolygonHelpers.calcPointAroundCircle(_center, BUILDING_ICON_RADIUS, BUILDING_ICON_START_ANGEL + angle * buildingIndex)
		)
		_buildingIconContainer.add_child(icon)

func _ready():
	_buildingIconPattern.hide()

	setOwnerColor()
	setUpBorder()
	_center = PolygonHelpers.calcPolygonCenter(_visualBodyPolygon)
	setBuildingIcons()
