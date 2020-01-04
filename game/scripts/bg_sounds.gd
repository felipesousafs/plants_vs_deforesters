extends Node2D

var rng = RandomNumberGenerator.new()
onready var bird_1_timer = get_node("bird_1_timer")
onready var bird_1_sound = get_node("bird_sound")
onready var cicada_timer = get_node("cicada_timer")
onready var cicada_sound = get_node("cicada")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


func _on_bird_1_timer_timeout():
	bird_1_timer.wait_time = rng.randi_range(10,25)
	bird_1_timer.start()
	bird_1_sound.play()


func _on_cicada_timer_timeout():
	cicada_timer.wait_time = rng.randi_range(15,35)
	cicada_timer.start()
	cicada_sound.play()
