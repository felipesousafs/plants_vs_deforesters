extends Area2D

onready var scene = get_tree().get_current_scene()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
    if event.is_action_pressed("touch"):
        scene.on_restart()