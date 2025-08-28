extends Control

const CODE_PAGE = preload("res://scenes/code_page/code_page.tscn")

@onready var pc_pages_container: Control = $PCPagesContainer

@export var arrow_quantity: int = 6
@export var layer_length: int = 6

func _ready() -> void:
	SignalManager.on_create_new_pc.connect(on_create_new_pc)

func _process(delta: float) -> void:
	pass

func on_create_new_pc() -> void:
	var inst = CODE_PAGE.instantiate()
	inst.how_many_arrows(arrow_quantity, layer_length)
	pc_pages_container.add_child(inst)
