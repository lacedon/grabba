extends Node2D
class_name AreaReactivityBody

@onready var _collisionPolygon: CollisionPolygon2D = $Area2D/CollisionPolygon2D

func setPolygons(polygon: PackedVector2Array) -> void:
	_collisionPolygon.polygon = polygon

func _on_body_input_event(viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			prints('\n> Click')
			prints('event', event)
			prints('\n')

			viewport.set_input_as_handled()
