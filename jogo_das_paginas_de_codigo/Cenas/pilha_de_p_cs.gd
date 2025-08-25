extends Area2D
#const PC = preload("res://Cenas/pc.tscn")
#var PC_instance
#var mouse_inside = false
#var mouse
#
#func _ready() -> void:
	#PC_instance = PC.instantiate()
	#PC_instance.position = 550
	#PC_instance.y.position = 320
#
#func _input(event: InputEvent) -> void:
	#if mouse_entered and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):	
		#add_child(PC_instance)
