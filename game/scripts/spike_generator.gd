extends Position2D

onready var spike = preload("res://scenes/spike.tscn")
onready var cena = get_tree().get_current_scene()

func _ready():
	pass
	
func create_spike():
	if cena.estado == cena.JOGANDO:
		var new_spike = spike.instance()
		new_spike.position = (Vector2(60, 20))
		owner.add_child(new_spike)