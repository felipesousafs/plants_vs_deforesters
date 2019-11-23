extends Node2D

#export var velocidade = -550
onready var cena = get_tree().get_current_scene()

var damage = 30

func _ready():
	set_process(true)
	
func _process(delta):
	if cena.estado == cena.JOGANDO:
		position = position + Vector2(120 * delta, 0)
	if position.x > 1000:
		queue_free()
