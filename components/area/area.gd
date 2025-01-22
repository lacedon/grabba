extends Node2D

const AreaResource = preload("res://types/area_resource.gd")
const PolygonHelpers = preload('res://helpers/polygon_helpers.gd')

@export var center: Vector2 = Vector2.INF
@export var ownerPlayerIndex: int = -1
@export var buildingNumber: int = 0
@export var buildings: Array[GameBuilding] = []
@export var resources: Array[AreaResource] = []

@onready var _visualBody: AreaVisualPolygon = $VisualPolygon
@onready var _buildingManager: AreaBuildingManager = $Buildings
@onready var _reactivityBody: AreaReactivityBody = $ReactivityBody
@onready var _areaResource: GameArea = GameArea.new(self.name, buildingNumber, buildings)

func setCenter() -> void:
	var size: Vector2 = _visualBody.getSize()
	center = Vector2(randf() * size.x, randf() * size.y)

func _ready() -> void:
	_visualBody.init(ownerPlayerIndex)
	_buildingManager.init(_areaResource, _visualBody.getCenter())
	_reactivityBody.init(_areaResource, _visualBody.getPolygons())

	if center == Vector2.INF:
		setCenter()
		_visualBody.setMainIcon(center)
