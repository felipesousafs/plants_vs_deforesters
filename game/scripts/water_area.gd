extends Area2D

onready var scene = get_tree().get_current_scene()

func _ready():
	pass

func _input_event(viewport, event, shape_idx):
    if event.is_action_pressed("touch"):
        self.on_click()
		
func on_click():
	scene.add_water_counter(50)
	print(scene.water)
	owner.queue_free()