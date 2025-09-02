extends Control

const SETA_CIMA_APAGADA = preload("res://assets/Setas/seta cima apagada.png")
const SETA_CIMA = preload("res://assets/Setas/seta cima.png")

const SETA_BAIXO_APAGADA = preload("res://assets/Setas/seta baixo apagada.png")
const SETA_BAIXO = preload("res://assets/Setas/seta baixo.png")

const SETA_DIREITA_APAGADA = preload("res://assets/Setas/seta direita apagada.png")
const SETA_DIREITA = preload("res://assets/Setas/seta direita.png")

const SETA_ESQUERDA_APAGADA = preload("res://assets/Setas/seta esquerda apagada.png")
const SETA_ESQUERDA = preload("res://assets/Setas/seta esquerda.png")

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var is_up: bool = false
@export var is_down: bool = false
@export var is_left: bool = false
@export var is_right: bool = false
var is_activate: bool = false

func _ready() -> void:
	init()

func _process(delta: float) -> void:
	controls()

func controls() -> void:
	if is_activate == true:
		if is_up == true:
			if Input.is_action_just_pressed("up"):
				after_input_correct()
				sprite_2d.texture = SETA_CIMA_APAGADA
			elif Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
				after_input_incorrect()
			
		if is_down == true:
			if Input.is_action_just_pressed("down"):
				after_input_correct()
				sprite_2d.texture = SETA_BAIXO_APAGADA
			elif Input.is_action_just_pressed("up") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
				after_input_incorrect()
			
		if is_left == true:
			if Input.is_action_just_pressed("left"):
				after_input_correct()
				sprite_2d.texture = SETA_ESQUERDA_APAGADA
			elif Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down") or Input.is_action_just_pressed("right"):
				after_input_incorrect()
			
		if is_right == true:
			if Input.is_action_just_pressed("right"):
				after_input_correct()
				sprite_2d.texture = SETA_DIREITA_APAGADA
			elif Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up"):
				after_input_incorrect()
	
func after_input_correct() -> void:
	desactivate_arrow()
	SignalManager.on_correct_key.emit()
	SignalManager.on_next_key.emit()

func after_input_incorrect() -> void:
	desactivate_arrow()
	SignalManager.on_incorrect_key.emit()
	
func activate_arrow() -> void:
	is_activate = true

func desactivate_arrow() -> void:
	is_activate = false
	set_process(false)

func init() -> void:
	if is_up == true:
		sprite_2d.texture = SETA_CIMA
	if is_down == true:
		sprite_2d.texture = SETA_BAIXO
	if is_left == true:
		sprite_2d.texture = SETA_ESQUERDA
	if is_right == true:
		sprite_2d.texture = SETA_DIREITA
