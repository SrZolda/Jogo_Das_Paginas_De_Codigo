extends Control

var area_to_stop_error: Area2D

const CODE_PAGE = preload("res://scenes/code_page/code_page.tscn")
@onready var pc_pages_container: Control = $PCPagesContainer

@export var arrow_quantity: int = 24
@export var layer_length: int = 6

var can_active_final_challenge: bool = false
var has_completed_final_challenge: bool = false

func _ready() -> void:
	SignalManager.on_has_completed_all_challenges.connect(on_has_completed_all_challenges)
	SignalManager.on_has_finished_successfully_pc.connect(on_has_finished_successfully_pc)
	SignalManager.on_incorrect_key.connect(on_incorrect_key)

func on_has_completed_all_challenges() -> void:
	can_active_final_challenge = true

func on_has_finished_successfully_pc() -> void:
	if has_completed_final_challenge == true:
		print("GG")

func _on_button_button_down() -> void:
	if GameManager.get_has_instantiated_pc_page() == false and can_active_final_challenge == true and has_completed_final_challenge == false:
		has_completed_final_challenge = true
		GameManager.on_create_new_pc(area_to_stop_error)
		var inst = CODE_PAGE.instantiate()
		inst.how_many_arrows(arrow_quantity, layer_length)
		pc_pages_container.add_child(inst)
		
func on_incorrect_key() -> void:
	has_completed_final_challenge = false
