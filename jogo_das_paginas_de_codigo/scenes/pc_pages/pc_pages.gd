extends Control


const CODE_PAGE = preload("res://scenes/code_page/code_page.tscn")

@export var arrow_quantity: int = 6
@export var layer_length: int = 6
@onready var code_page: Node2D = $CodePage

var has_instantiated: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	if has_instantiated == false:
		inst_code_page()

func inst_code_page() -> void:
	var inst = CODE_PAGE.instantiate()
	inst.how_many_arrows(arrow_quantity)
	code_page.add_child(inst)
	has_instantiated = true


## signal para desaticar has_instantiated
