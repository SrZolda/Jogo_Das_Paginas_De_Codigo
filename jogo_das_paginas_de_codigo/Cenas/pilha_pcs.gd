extends Button

const PC = preload("res://Cenas/pc.tscn")
var pc_instance

func _ready() -> void:
	pc_instance = PC.instantiate()
	#pc_instance.position = Vector2(550, 320)

		
func _input(event: InputEvent) -> void:
	if button_pressed:
		add_child(pc_instance)
		print ("teste")
