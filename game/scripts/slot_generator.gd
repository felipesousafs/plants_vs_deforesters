extends Position2D

onready var slot = preload("res://scenes/slot.tscn")
onready var game_scene = get_tree().get_current_scene()

func _ready():
	for i in range(5):
		for j in range(10):
			var novo_slot = slot.instance()
			novo_slot.position = (Vector2(j*100, (i*100)+100))
			game_scene.call_deferred("add_child", novo_slot)
