extends HBoxContainer
class_name GameUIBuildingManager

const BuildingButton: = preload('./building_item/building_item.tscn')

func clearButtons() -> void:
	for child in get_children():
		remove_child(child)

func createBuildingButton(area: GameArea, building: GameBuilding) -> GameUIBuildingItem:
	var buildingButton: GameUIBuildingItem = BuildingButton.instantiate()
	buildingButton.init(area, building)
	return buildingButton

func addButtons(area: GameArea) -> void:
	var buildedBuildingsCount: int = area.buildings.size()
	for index in range(area.maxBuildingNumber):
		add_child(createBuildingButton(area, area.buildings[index] if index < buildedBuildingsCount else null))

func open(area: GameArea) -> void:
	clearButtons()
	addButtons(area)

func close() -> void:
	clearButtons()
