extends Control

@onready var _areaNameField: Label = $Info/AreaName
@onready var _buildingManager: GameUIBuildingManager = $BuildingManager

func setAreaName(areaName: String) -> void:
	_areaNameField.text = areaName

func selectArea(area: GameArea) -> void:
	if area:
		setAreaName(area.name)
		_buildingManager.open(area)
	else:
		setAreaName('')
		_buildingManager.close()

func _ready() -> void:
	EventEmitter.AddListener(AreaReactivityBody.signal_select_area, self, selectArea)

func _exit_tree() -> void:
	EventEmitter.RemoveListener(AreaReactivityBody.signal_select_area, self, selectArea)
