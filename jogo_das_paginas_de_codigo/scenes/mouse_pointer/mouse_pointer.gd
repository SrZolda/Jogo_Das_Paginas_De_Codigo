extends Area2D

func _process(delta: float) -> void:
	update_mouse_position()

func update_mouse_position() -> void:
	position = get_global_mouse_position()
