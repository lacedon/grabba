extends Button
class_name GameUIUnitItem

signal order(area: GameArea, unit: GameUnit)

static var signal_order: StringName = 'order'

const DEFAULT_TITLE: String = 'Hire...'

const DEFAULT_ICON: = preload("res://static/plus.svg")

var area: GameArea

func init(_area: GameArea, _unit: GameUnit = null) -> void:
	area = _area

	setUnitData(_unit)

func setUnitData(_unit: GameUnit = null) -> void:
	text = _unit.name if _unit else DEFAULT_TITLE
	icon = _unit.icon if _unit else DEFAULT_ICON

func _ready() -> void:
	EventEmitter.AddEmitter(order.get_name(), self)

func _exit_tree() -> void:
	EventEmitter.RemoveEmitter(order.get_name(), self)
