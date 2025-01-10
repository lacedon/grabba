extends Button
class_name GameUIBuildingItem

signal build(area: GameArea, buildingIndex: int, building: GameBuilding)
signal order(area: GameArea, unit: GameUnit)

static var signal_build: StringName = 'build'
static var signal_order: StringName = 'order'

const DEFAULT_TITLE: String = 'Build...'

const DEFAULT_ICON: = preload("res://static/plus.svg")

@onready var _popup: PopupMenu = $PopupMenu

var area: GameArea
var buildingIndex: int
var building: GameBuilding

func init(_buildingIndex: int, _area: GameArea, _building: GameBuilding = null) -> void:
	buildingIndex = _buildingIndex
	area = _area
	building = _building

	setBuildingData(_building)

func setBuildingData(_building: GameBuilding = null) -> void:
	text = _building.name if _building else DEFAULT_TITLE
	icon = _building.icon if _building else DEFAULT_ICON

func openPopup() -> void:
	_popup.title = building.name if building else DEFAULT_TITLE

	_popup.clear()
	if building:
		for unit in building.units:
			_popup.add_icon_item(unit.icon, 'Order ' + unit.name)
	else:
		for buildingItem in GameConstants.buildingsAsList:
			_popup.add_icon_item(buildingItem.icon, 'Build ' + buildingItem.name)

	_popup.show()

func select_menu_item(index: int) -> void:
	if building:
		emit_signal(order.get_name(), area, building.units[index])
	else:
		var toBuild: GameBuilding = GameConstants.buildingsAsList[index]
		emit_signal(build.get_name(), area, buildingIndex, toBuild)

		setBuildingData(toBuild)

func _ready() -> void:
	EventEmitter.AddEmitter(build.get_name(), self)
	EventEmitter.AddEmitter(order.get_name(), self)

func _exit_tree() -> void:
	EventEmitter.RemoveEmitter(build.get_name(), self)
	EventEmitter.RemoveEmitter(order.get_name(), self)
