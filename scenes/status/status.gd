extends Control

@onready var wall_count_label: Label = $MarginContainer/WallCountLabel

var walls_quantity: int = 0
var walls_completed_count: int = 0
var has_emitted_on_completed_all_walls: bool = false

func _ready() -> void:
	SignalManager.on_give_status_info.connect(on_give_status_info)
	SignalManager.on_has_finished_successfully_pc.connect(on_has_finished_successfully_pc)

func _process(delta: float) -> void:
	update_label()
	on_completed_all_walls()

func update_label() -> void:
	if has_emitted_on_completed_all_walls == false:
		wall_count_label.text = "%d / %d" % [walls_completed_count, walls_quantity]

func on_completed_all_walls() -> void:
	if walls_completed_count == walls_quantity and has_emitted_on_completed_all_walls == false:
		has_emitted_on_completed_all_walls = true
		SignalManager.on_has_completed_all_challenges.emit()

func on_give_status_info(walls: int) -> void:
	walls_quantity = walls

func on_has_finished_successfully_pc() -> void:
	walls_completed_count += 1
