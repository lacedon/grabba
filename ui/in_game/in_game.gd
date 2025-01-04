extends Control

func createBuildingButtons():
	pass
	# for building in GameConstants.buildings:
	# 	pass

func test() -> void:
	prints('test')

func _ready() -> void:
	EventEmitter.AddListener(AreaReactivityBody.signal_select_area, self, test)

func _exit_tree() -> void:
	EventEmitter.RemoveListener(AreaReactivityBody.signal_select_area, self, test)
