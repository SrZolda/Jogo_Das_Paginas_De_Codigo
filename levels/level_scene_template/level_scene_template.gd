extends Control

const CODE_PAGE = preload("res://scenes/code_page/code_page.tscn")

@onready var pc_pages_container: Control = $PCPagesContainer

@onready var wall_holder: Node2D = $NotCanvas/WallHolder

@export var arrow_quantity: int = 6
@export var layer_length: int = 6

var area2d_holder: Area2D

func _ready() -> void:
	init()
	
	SignalManager.on_create_new_pc.connect(on_create_new_pc)
	SignalManager.on_has_finished_successfully_pc.connect(on_has_finished_successfully_pc)
	SignalManager.on_incorrect_key.connect(on_incorrect_key)

func on_has_finished_successfully_pc() -> void:
	if area2d_holder:
		area2d_holder.on_has_finished_successfully_pc()

func on_incorrect_key() -> void:
	area2d_holder = null

func on_create_new_pc(area2d: Area2D) -> void:
	area2d_holder = area2d
	var inst = CODE_PAGE.instantiate()
	inst.how_many_arrows(arrow_quantity, layer_length)
	pc_pages_container.add_child(inst)

func init() -> void:
	SignalManager.on_give_status_info.emit(wall_holder.get_child_count())
