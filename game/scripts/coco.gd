extends Node2D

#export var velocidade = -550
onready var cena = get_tree().get_current_scene()
onready var hit_sfx = cena.get_node("coco_hit")
var damage = 50
const kind = "projetile"

func _ready():
	set_process(true)
	
func _process(delta):
	position = position + Vector2(120 * delta, 0)
	if position.x > 1000:
		queue_free()

func play_hit():
	hit_sfx.play()