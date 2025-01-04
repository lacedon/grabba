extends Node2D

const AreaResource = preload("res://types/area_resource.gd")

@export var ownerPlayerIndex: int = -1
@export var buildingNumber: int = 0
@export var buildings: Array[GameBuilding] = []
@export var resources: Array[AreaResource] = []

@onready var _visualBodyPolygon: AreaVisualPolygon = $VisualPolygon
@onready var _buildingContainer: AreaBuildingManager = $Buildings

func _ready():
	_visualBodyPolygon.prepare(ownerPlayerIndex)
	var center: = _visualBodyPolygon.getCenter()

	_buildingContainer.setBuildingIcons(center, buildingNumber)
