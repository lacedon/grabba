extends Node2D

const AreaResource = preload("res://types/area_resource.gd")

@export var ownerPlayerIndex: int = -1
@export var buildingNumber: int = 0
@export var resources: Array[AreaResource] = []
