extends Control

var has_instantiated: bool = false

func _ready() -> void:
	SignalManager.has_finished_pc.connect(has_finished_pc)

func _on_button_button_down() -> void:
	if has_instantiated == false:
		SignalManager.on_create_new_pc.emit()
		has_instantiated = true

func has_finished_pc() -> void:
	has_instantiated = false
