extends Node

static func calcPolygonCenter(polygon: Polygon2D) -> Vector2:
	var center: Vector2 = Vector2.ZERO

	for point in polygon.polygon:
		center.x += point.x
		center.y += point.y

	center /= polygon.polygon.size()

	return center

static func calcPointAroundCircle(center: Vector2, radius: float, angle: float) -> Vector2:
	var _position: = Vector2(radius * cos(angle), -radius * sin(angle))
	return center + _position
