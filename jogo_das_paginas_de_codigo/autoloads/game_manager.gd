extends Node

var has_instantiated_pc_page: bool = false
func get_has_instantiated_pc_page() -> bool:
	return has_instantiated_pc_page
func set_has_instantiated_pc_page(value: bool) -> void:
	has_instantiated_pc_page = value
	
func _ready() -> void:
	SignalManager.has_finished_pc.connect(has_finished_pc)
	SignalManager.on_create_new_pc.connect(on_create_new_pc)
	
func on_create_new_pc() -> void:
	set_has_instantiated_pc_page(true)

func has_finished_pc() -> void:
	set_has_instantiated_pc_page(false)
