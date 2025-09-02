extends Control

const UP_ARROW = preload("res://scenes/arrows/up_arrow/up_arrow.tscn")
const DOWN_ARROW = preload("res://scenes/arrows/down_arrow/down_arrow.tscn")
const LEFT_ARROW = preload("res://scenes/arrows/left_arrow/left_arrow.tscn")
const RIGHT_ARROW = preload("res://scenes/arrows/right_arrow/right_arrow.tscn")
@onready var _arrows = [UP_ARROW, DOWN_ARROW, LEFT_ARROW, RIGHT_ARROW] 

@onready var v_box_container: VBoxContainer = $VBoxContainer
const H_BOX_CONTAINER = preload("res://scenes/code_page/h_box_container.tscn")
var current_layer: HBoxContainer

var arrows = []
@export var arrow_quantity: int = 6
@export var layer_lenght: int = 6
var current_index: int = 0
var has_created_arrows: bool = false
var can_active_next_key: bool = true

func _ready() -> void:
	SignalManager.on_next_key.connect(on_next_key)
	SignalManager.on_incorrect_key.connect(on_incorrect_key)

func _process(delta: float) -> void:
	create_arrows()
	activate_arrow()

func create_arrows() -> void:
	if arrows.size() < arrow_quantity and has_created_arrows == false:
		inst_rand_arrow()
	if arrows.size() == arrow_quantity and has_created_arrows == false:
		has_created_arrows = true
	
func activate_arrow() -> void:
	if has_created_arrows == true and can_active_next_key == true:
		arrows.get(current_index).activate_arrow()
		current_index += 1
		can_active_next_key = false
		
func inst_rand_arrow() -> void:
	var inst = _arrows.get(randi_range(0, 3)).instantiate()
	arrows.append(inst)
	layer_to_inst(inst)
	
func layer_to_inst(inst: Control) -> void:
	if v_box_container.get_child_count() == 0:
		inst_new_layer()
	
	if current_layer:
		if current_layer.get_child_count() < layer_lenght:
			current_layer.add_child(inst)
		if current_layer.get_child_count() == layer_lenght:
			inst_new_layer()
	
func inst_new_layer() -> void:
	current_layer = H_BOX_CONTAINER.instantiate()
	current_layer.add_theme_constant_override("separation", 124) ## TIVE Q USAR O CHATGPT AQUI, estou documentando o crime, current_layer.separation n fucionava :( e n tinha nada na documentão
	v_box_container.add_child(current_layer)
	
func how_many_arrows(_arrow_quantity: int = 6, _layer_lenght: int = 6) -> void:
	arrow_quantity = _arrow_quantity
	layer_lenght = _layer_lenght
	
func on_next_key() -> void:
	if current_index < arrows.size():
		activate_arrow()
		can_active_next_key = true
		
	if current_index == arrows.size():
		SignalManager.on_has_finished_successfully_pc.emit()
		SignalManager.has_finished_pc.emit()
		queue_free()

func on_incorrect_key() -> void:
	SignalManager.has_finished_pc.emit()
	queue_free()
