extends Node2D
class_name AreaReactivityBody

signal select_area(area: GameArea)

# TODO: Can this be rewriten not to define my own signal name but still can be used as a static property of the class(used via EventEmitter)?
static var signal_select_area: StringName = 'select_area'

@onready var _collisionPolygon: CollisionPolygon2D = $Area2D/CollisionPolygon2D

var _area: GameArea

func setPolygons(polygon: PackedVector2Array) -> void:
	_collisionPolygon.polygon = polygon

func init(area: GameArea, polygon: PackedVector2Array) -> void:
	_area = area
	setPolygons(polygon)

func _on_body_input_event(viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			viewport.set_input_as_handled()
			self.emit_signal(select_area.get_name(), _area)

func _ready() -> void:
	EventEmitter.AddEmitter(select_area.get_name(), self)

func _exit_tree() -> void:
	EventEmitter.RemoveEmitter(select_area.get_name(), self)
