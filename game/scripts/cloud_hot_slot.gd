extends Node2D

onready var card_anim = get_node("cloud_hot_slot_sprite/on_click_anim")
onready var scene = get_tree().get_current_scene()

func _ready():
	set_process(true)


func _process(delta):
	if scene.card_selected == "cloud_hot":
		card_anim.play()
	else:
		card_anim.stop()
		card_anim.frame = 0
