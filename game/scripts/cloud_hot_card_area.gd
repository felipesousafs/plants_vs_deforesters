extends Area2D

onready var scene = get_tree().get_current_scene()
onready var cloud = preload("res://scenes/cloud_hot.tscn")

func _ready():
	#set_process(true)
	pass

func _input_event(viewport, event, shape_idx):
    if event.is_action_pressed("touch") && scene.water >= cloud.instance().COST:
        self.on_click()
		
func on_click():
	if scene.card_selected:
		scene.card_selected = null
	else:
		scene.card_selected  = "cloud_hot"