extends Node2D
class_name AreaBuildingIcon

const PolygonHelpers = preload('res://helpers/polygon_helpers.gd')

@onready var _backgroundPolygon: Polygon2D = $Background
@onready var _iconPolygon: Polygon2D = $BuildingIconPattern

func getSize() -> Vector2:
	return PolygonHelpers.calcPolygonSize(_backgroundPolygon)

func init(building: GameBuilding) -> void:
	_iconPolygon.texture = building.icon
	_iconPolygon.show()