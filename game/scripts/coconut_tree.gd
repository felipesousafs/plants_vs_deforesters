extends Node2D

onready var coconut_anim = self.get_node("coconut_sprite/coconut_anim")
onready var attack_timer = get_node("coco_generator/attack_timer")
onready var coco_generator = get_node("coco_generator")

var life = 100
const COST = 150
const kind = "plant"


func _ready():
	pass # Replace with function body.


func _on_attack_timer_timeout():
	coconut_anim.play()


func _on_coconut_anim_animation_finished():
	coco_generator.create_coco()
	coconut_anim.stop()
	attack_timer.start()
