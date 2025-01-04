extends Node

static func calcPolygonSize(polygon: Polygon2D) -> Vector2:
	var minPoint: Vector2 = Vector2.ZERO
	var maxPoint: Vector2 = Vector2.ZERO
	var isInit: bool = true

	for point in polygon.polygon:
		if minPoint.x > point.x || isInit: minPoint.x = point.x
		if minPoint.y > point.y || isInit: minPoint.y = point.y
		if maxPoint.x < point.x || isInit: maxPoint.x = point.x
		if maxPoint.y < point.y || isInit: maxPoint.y = point.y
		isInit = false

	return Vector2(maxPoint.x - minPoint.x, maxPoint.y - minPoint.y)

static func calcPolygonCenter(polygon: Polygon2D) -> Vector2:
	var center: Vector2 = Vector2.ZERO

	for point in polygon.polygon:
		center.x += point.x
		center.y += point.y

	center /= polygon.polygon.size()

	return center

static func calcPointAroundCircle(center: Vector2, radius: Vector2, angle: float) -> Vector2:
	var _position: = Vector2(radius.x * cos(angle), radius.y * sin(angle))
	return center + _position
