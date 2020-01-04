extends Node2D

var life = 9999

func _ready():
	set_process(true)

func _process(delta):
	position = position + Vector2(10*delta, 40*delta)
	if position.y > 600:
		queue_free()