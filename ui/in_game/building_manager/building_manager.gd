extends HBoxContainer
class_name GameUIBuildingManager

const BuildingButton: = preload('./building_item/building_item.tscn')

func clearButtons() -> void:
	for child in get_children():
		remove_child(child)

func createBuildingButton(index: int, area: GameArea, building: GameBuilding) -> GameUIBuildingItem:
	var buildingButton: GameUIBuildingItem = BuildingButton.instantiate()
	buildingButton.init(index, area, building)
	return buildingButton

func addButtons(area: GameArea) -> void:
	var buildedBuildingsCount: int = area.buildings.size()
	for index in range(area.maxBuildingNumber):
		add_child(createBuildingButton(index, area, area.buildings[index] if index < buildedBuildingsCount else null))

func addEmptyView() -> void:
	var button: GameUIBuildingItem = createBuildingButton(0, null, null)
	button.disabled = true

	add_child(button)

func open(area: GameArea) -> void:
	clearButtons()
	addButtons(area)

func close() -> void:
	clearButtons()
	addEmptyView()

func _ready() -> void:
	addEmptyView()
