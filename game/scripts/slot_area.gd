extends Area2D

onready var scene = get_tree().get_current_scene()
var has_cactus = false

func _ready():
	pass # Replace with function body.
	
func _input_event(viewport, event, shape_idx):
    if event.is_action_pressed("touch") && scene.card_selected:
        self.on_click()

func on_click():
	print(owner.position)
	if has_cactus == false:
		scene.add_cactus(owner.position)
		has_cactus = true
		scene.card_selected = !scene.card_selected