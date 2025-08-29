extends Control

@onready var timer: Timer = $Timer
@onready var texture_progress_bar: TextureProgressBar = $MarginContainer/VBoxContainer/TextureProgressBar

@export var how_many_seconds: int = 120
@export var how_many_seconds_you_lose_per_fail: int = 10

func _ready() -> void:
	init()
	SignalManager.on_incorrect_key.connect(on_incorrect_key)

func on_incorrect_key() -> void:
	texture_progress_bar.value -= how_many_seconds_you_lose_per_fail

func _on_timer_timeout() -> void:
	if texture_progress_bar.value > texture_progress_bar.min_value:
		texture_progress_bar.value -= 1
		timer.start()
	elif texture_progress_bar.value == texture_progress_bar.min_value:
		## codigo fim de jogo
		pass

func init() -> void:
	texture_progress_bar.max_value = how_many_seconds
	texture_progress_bar.value = how_many_seconds
