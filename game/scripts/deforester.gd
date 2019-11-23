extends Node2D

onready var scene = get_tree().get_current_scene()
var life = 100
var status = 1

const RUNNING = 1
const ATTACKING = 2

func _ready():
	set_process(true)
	
func _process(delta):
	if scene.estado == scene.JOGANDO && life >= 0 && status == RUNNING:
		position = position + Vector2(-40 * delta, 0)
		#if position.x < 500 && times == 0 && jump:
			#times = 1
			#print(position.x)
			#jumpAnim.play("ladrao_jump")
	if position.x < -100 || life < 0:
		queue_free()


func _on_deforester_area_area_entered(area):
	if area.name == "spike_area":
		area.owner.queue_free()
		self.life -= area.owner.damage
