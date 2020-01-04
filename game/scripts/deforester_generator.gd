extends Position2D

onready var scene = get_tree().get_current_scene()
onready var deforester = preload("res://scenes/deforester.tscn")
onready var tractor = preload("res://scenes/tractor.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()


func _on_deforester_timer_timeout():
	create_deforester()
	
func create_deforester():
	var new_deforester = deforester.instance()
	var line = rng.randi_range(1,5)
	new_deforester.position = (Vector2(1040, (line * 100) + 20))
	owner.add_child(new_deforester)


func create_tractor():
	var new_tractor = tractor.instance()
	var line = rng.randi_range(1,5)
	new_tractor.position = (Vector2(1040, (line * 100)))
	owner.add_child(new_tractor)

func _on_deforester_hord_timer_timeout():
	for i in range(scene.elapsed / 20):
		create_deforester()
	for j in range((scene.elapsed / 60) * 1.5):
		create_deforester()
	for j in range((scene.elapsed / 80) * 1.5):
		print("Trator criado")
		create_tractor()
