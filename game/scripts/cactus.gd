extends Node2D

onready var cactus_anim = self.get_node("cactus_sprite/cactus_attack_anim")
onready var attack_timer = get_node("spike_generator/attack_timer")
onready var spike_generator = get_node("spike_generator")

var slot = null
var life = 100
const COST = 100
const kind = "plant"

func _ready():
	set_process(true)

func _process(delta):
	pass

func _on_attack_timer_timeout():
	cactus_anim.play()
	

func _on_cactus_attack_anim_animation_finished():
	spike_generator.create_spike()
	cactus_anim.stop()
	attack_timer.start()

