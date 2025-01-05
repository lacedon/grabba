extends Control

func createBuildingButtons():
	pass
	# for building in GameConstants.buildings:
	# 	pass

func selectArea(area: GameArea) -> void:
	prints('selectArea', area)

func _ready() -> void:
	EventEmitter.AddListener(AreaReactivityBody.signal_select_area, self, selectArea)

func _exit_tree() -> void:
	EventEmitter.RemoveListener(AreaReactivityBody.signal_select_area, self, selectArea)
