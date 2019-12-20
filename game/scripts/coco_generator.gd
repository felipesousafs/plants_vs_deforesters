extends Position2D

onready var coco = preload("res://scenes/coco.tscn")
onready var cena = get_tree().get_current_scene()

func _ready():
	pass
	
func create_coco():
	if cena.estado == cena.JOGANDO:
		var new_coco = coco.instance()
		new_coco.position = (Vector2(60, 20))
		owner.add_child(new_coco)