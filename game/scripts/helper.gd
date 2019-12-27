extends Node2D

onready var scene = get_tree().get_current_scene()
onready var dica_menu = get_node("dica_menu")
onready var dica_chuva = get_node("dica_chuva")
onready var dica_planta_mais_agua = get_node("dica_planta_mais_agua")

onready var dicas_list = [dica_menu, dica_chuva, dica_planta_mais_agua]
var dica_selected = 0

func _ready():
	dicas_list[dica_selected].visible = true


func _on_play_pressed():
	scene.estado = scene.JOGANDO
	get_tree().paused = false


func _on_next_pressed():
	if dica_selected < (dicas_list.size() - 1):
		dica_selected += 1
	else:
		dica_selected = 0
	set_visible_dica()


func _on_prev_pressed():
	if dica_selected > 0:
		dica_selected -= 1
	else:
		dica_selected = 2
	set_visible_dica()

func set_visible_dica():	
	for i in dicas_list.size():
		if i == dica_selected:
			dicas_list[i].visible = true
		else:
			dicas_list[i].visible = false