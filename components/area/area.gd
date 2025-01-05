extends Node2D

const AreaResource = preload("res://types/area_resource.gd")

@export var ownerPlayerIndex: int = -1
@export var buildingNumber: int = 0
@export var buildings: Array[GameBuilding] = []
@export var resources: Array[AreaResource] = []

@onready var _visualBody: AreaVisualPolygon = $VisualPolygon
@onready var _buildingManager: AreaBuildingManager = $Buildings
@onready var _reactivityBody: AreaReactivityBody = $ReactivityBody
@onready var _areaResource: GameArea = GameArea.new(self.name, buildingNumber, buildings)

func _ready():
	_visualBody.init(ownerPlayerIndex)
	_buildingManager.init(_areaResource, _visualBody.getCenter())
	_reactivityBody.init(_areaResource, _visualBody.getPolygons())
