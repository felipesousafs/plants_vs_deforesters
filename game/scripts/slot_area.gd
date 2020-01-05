extends Area2D

onready var scene = get_tree().get_current_scene()
onready var countdown = get_node("countdown")
var free_flag = 0
var has_hot_cloud = false
var has_cold_cloud = false

func _ready():
	pass

func _input_event(viewport, event, shape_idx):
    if event.is_action_pressed("touch") && scene.card_selected:
        self.on_click()

func on_click():
	print(scene.card_selected)
	if free_flag < 2:
		if scene.card_selected == "cactus":
			scene.add_cactus(owner.position)
			free_flag = 2
			scene.card_selected = null
		if scene.card_selected == "coconut_tree":
			scene.add_coconut_tree(owner.position)
			free_flag = 2
			scene.card_selected = null
		if scene.card_selected == "cloud_hot":
			scene.add_cloud_hot(owner.position)
			free_flag += 1
			scene.card_selected = null
			has_hot_cloud = true
			if has_cold_cloud && has_hot_cloud:
				scene.cloud_counter += 1
				if scene.cloud_counter == scene.cloud_counter_limit:
					scene.inundation()
				countdown.start()
		if scene.card_selected == "cloud_cold":
			scene.add_cloud_cold(owner.position)
			free_flag += 1
			scene.card_selected = null
			has_cold_cloud = true
			if has_cold_cloud && has_hot_cloud:
				scene.cloud_counter += 1
				if scene.cloud_counter == scene.cloud_counter_limit:
					scene.inundation()
				countdown.start()

func _on_countdown_timeout():
	scene.add_water()
