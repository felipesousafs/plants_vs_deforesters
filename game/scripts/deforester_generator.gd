extends Position2D

onready var scene = get_tree().get_current_scene()
onready var deforester = preload("res://scenes/deforester.tscn")
onready var tractor = preload("res://scenes/tractor.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()


func _on_deforester_timer_timeout():
	if scene.hord_count < scene.number_of_hords_to_win:
		create_deforester()
	
func create_deforester():
	var new_deforester = deforester.instance()
	var line = rng.randi_range(1,5)
	new_deforester.position = (Vector2(1040, (line * 100) + 20))
	owner.add_child(new_deforester)
	scene.deforesters_created += 1


func create_tractor():
	var new_tractor = tractor.instance()
	var line = rng.randi_range(1,5)
	new_tractor.position = (Vector2(1040, (line * 100)))
	owner.add_child(new_tractor)
	scene.deforesters_created += 1

func _on_deforester_hord_timer_timeout():
	if scene.hord_count < scene.number_of_hords_to_win:
		for i in range((scene.elapsed / 30) * scene.cloud_counter):
			create_deforester()
		for j in range((scene.elapsed / 60) * (scene.cloud_counter + 2.5)):
			var t = Timer.new()
			t.set_wait_time(2)
			add_child(t)
			t.start()
			yield(t, "timeout")
			create_deforester()
			create_deforester()
			t.queue_free()
		for j in range((scene.elapsed / 80) * 1.5):
			create_tractor()
			for k in range(scene.cloud_counter * 3):
				create_deforester()
		scene.hord_count += 1
