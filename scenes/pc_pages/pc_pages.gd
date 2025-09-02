extends Control

const CODE_PAGE = preload("res://scenes/code_page/code_page.tscn")
@onready var pc_pages_container: Control = $PCPagesContainer

@export var arrow_quantity: int = 6
@export var layer_length: int = 6

var has_instantiated: bool = false

func _ready() -> void:
	SignalManager.has_finished_pc.connect(has_finished_pc)

func _on_button_button_down() -> void:
	if has_instantiated == false:
		has_instantiated = true
		var inst = CODE_PAGE.instantiate()
		inst.how_many_arrows(arrow_quantity, layer_length)
		pc_pages_container.add_child(inst)
		
func has_finished_pc() -> void:
	has_instantiated = false
