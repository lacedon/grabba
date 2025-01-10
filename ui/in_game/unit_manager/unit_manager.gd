extends HBoxContainer
class_name GameUIUnitManager

const UnitButton: = preload('./unit_item/unit_item.tscn')

var _area: GameArea = null

func clearButtons() -> void:
	for child in get_children():
		remove_child(child)

func createUnitButton(area: GameArea, unit: GameUnit) -> GameUIUnitItem:
	var button: GameUIUnitItem = UnitButton.instantiate()
	button.init(area, unit)
	return button

func addButtons(area: GameArea) -> int:
	var count: int = 0
	for building in area.buildings:
		if building:
			for unit in building.units:
				add_child(createUnitButton(area, unit))
				count += 1
	return count

func addEmptyView() -> void:
	var button: GameUIUnitItem = createUnitButton(null, null)
	button.disabled = true

	add_child(button)

func open(area: GameArea) -> void:
	_area = area

	clearButtons()
	var unitCount: int = addButtons(area)
	if unitCount == 0:
		addEmptyView()

func close() -> void:
	clearButtons()
	addEmptyView()

func handleBuilding(localArea: GameArea, _buildingIndex: int, _building: GameBuilding) -> void:
	if localArea == _area:
		open(localArea)

func _ready() -> void:
	addEmptyView()

	EventEmitter.AddListener(GameUIBuildingItem.signal_build, self, handleBuilding)

func _exit_tree() -> void:
	EventEmitter.RemoveListener(GameUIBuildingItem.signal_build, self, handleBuilding)