extends Node2D

const UP_ARROW = preload("res://scenes/arrows/up_arrow/up_arrow.tscn")
const DOWN_ARROW = preload("res://scenes/arrows/down_arrow/down_arrow.tscn")
const LEFT_ARROW = preload("res://scenes/arrows/left_arrow/left_arrow.tscn")
const RIGHT_ARROW = preload("res://scenes/arrows/right_arrow/right_arrow.tscn")
@onready var _arrows = [UP_ARROW, DOWN_ARROW, LEFT_ARROW, RIGHT_ARROW] 

@onready var arrow_h_box_container: HBoxContainer = $ArrowHBoxContainer

var arrows = []
@export var max_arrow_lenght: int = 6
var current_index: int = 0
var has_created_arrows: bool = false

func _ready() -> void:
	SignalManager.on_next_key.connect(on_next_key)

func _process(delta: float) -> void:
	create_arrows()

func create_arrows() -> void:
	if arrows.size() < max_arrow_lenght and has_created_arrows == false:
		inst_rand_arrow()
	
	if arrows.size() == max_arrow_lenght:
		has_created_arrows = true
		activate_arrow()
	
func activate_arrow() -> void:
	if arrows.is_empty() != true:
		arrows.get(0).activate_arrow()
		arrows.remove_at(0)
		
func inst_rand_arrow() -> void:
	var inst = _arrows.get(randi_range(0, 3)).instantiate()
	arrows.append(inst)
	arrow_h_box_container.add_child(inst)
	
func on_next_key() -> void:
	activate_arrow()
