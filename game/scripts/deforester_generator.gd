extends Position2D

onready var deforester = preload("res://scenes/deforester.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	pass


func _on_deforester_timer_timeout():
	create_deforester()
	
func create_deforester():
	var new_deforester = deforester.instance()
	var line = rng.randi_range(1,5) # todo: rand range precisa ser inteiro
	new_deforester.position = (Vector2(1050, line * 100))
	owner.add_child(new_deforester)
