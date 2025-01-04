extends Node2D

const AreaResource = preload("res://types/area_resource.gd")

@export var ownerPlayerIndex: int = -1
@export var buildingNumber: int = 0
@export var buildings: Array[GameBuilding] = []
@export var resources: Array[AreaResource] = []

@onready var _visualBody: AreaVisualPolygon = $VisualPolygon
@onready var _buildingManager: AreaBuildingManager = $Buildings
@onready var _reactivityBody: AreaReactivityBody = $ReactivityBody

func _ready():
	_visualBody.prepare(ownerPlayerIndex)
	_buildingManager.setBuildingIcons(_visualBody.getCenter(), buildingNumber)
	_reactivityBody.setPolygons(_visualBody.getPolygons())
