extends Node2D
class_name AreaBuildingIcon

const PolygonHelpers = preload('res://helpers/polygon_helpers.gd')

@onready var _backgroundPolygon: Polygon2D = $Background

func getSize() -> Vector2:
	return PolygonHelpers.calcPolygonSize(_backgroundPolygon)
