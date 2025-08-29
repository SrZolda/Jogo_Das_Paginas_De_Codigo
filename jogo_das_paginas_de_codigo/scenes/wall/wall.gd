extends Area2D

@export var blank_image: Texture2D
@export var image: Texture2D
@onready var sprite_2d: Sprite2D = $Sprite2D

var can_click: bool = false

func _ready() -> void:
	init()

func _process(delta: float) -> void:
	click()

func click() -> void:
	if can_click == true and GameManager.get_has_instantiated_pc_page() == false:
		if Input.is_action_just_pressed("click"):
			SignalManager.on_create_new_pc.emit(self) ###ARRUMAR LOGO
			
func on_has_finished_successfully_pc() -> void:
	change_to_correct_image()
	## + algum codigo para o sistema de nivel 
	set_process(false)

func change_to_correct_image() -> void:
	sprite_2d.texture = image

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Pointer"):
		can_click = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("Pointer"):
		can_click = false

func init() -> void:
	sprite_2d.texture = blank_image
