extends Area2D

onready var scene = get_tree().get_current_scene()
onready var coconut = preload("res://scenes/coconut_tree.tscn")


func _ready():
	#set_process(true)
	pass

#func _process(delta):
#	if scene.water <= coconut.instance().COST:
#		print("deixar cinza se n tiver agua")

func _input_event(viewport, event, shape_idx):
    if event.is_action_pressed("touch") && scene.water >= coconut.instance().COST:
        self.on_click()
		
func on_click():
	if scene.card_selected:
		scene.card_selected = null
	else:
		scene.card_selected  = "coconut_tree"
	print(coconut.instance().COST)
	print(scene.water)