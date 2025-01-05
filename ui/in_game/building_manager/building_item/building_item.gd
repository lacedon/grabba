extends Button
class_name GameUIBuildingItem

func init(_area: GameArea, building: GameBuilding = null) -> void:
	if building:
		name = building.name
		icon = building.icon
