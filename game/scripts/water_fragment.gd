extends Node2D


func _ready():
	set_process(true)

func _process(delta):
	position = position + Vector2(10*delta, 40*delta)
	if position.y > 1000:
		queue_free()