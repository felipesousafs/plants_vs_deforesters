extends Node2D

onready var cactus_generator = get_node("cactuses/cactuses_generator")
onready var coconut_generator = get_node("coconut_trees/coconut_generator")
onready var hot_generator = get_node("clouds/hot_generator")
onready var cold_generator = get_node("clouds/cold_generator")
onready var water_generator = get_node("water_fragments/water_generator")
onready var water_count = get_node("water_board/Control/Label")
onready var water_fragment = preload("res://scenes/water_fragment.tscn")
onready var loser_panel_node = get_node("loser_panel")
onready var dicas_panel_node = get_node("helper")
onready var deforesters_killed_label = get_node("deforesters_killed_board/deforesters_killed_ctrl/deforesters_killed_label")

var time_start = 0
var time_now = 0
var elapsed = 0
var deforesters_count = 0

var estado = 1
var card_selected = null

const JOGANDO = 1
const PERDENDO = 2
const PAUSADO = 3
const VENCEU = 4


var water = 300

func _ready():
	water_count.set_text(str(water))
	set_process(true)
	
func _process(delta):
	if estado == JOGANDO:
		dicas_panel_node.visible = false
		get_tree().paused = false
	if estado == PAUSADO:
		dicas_panel_node.visible = true
		get_tree().paused = true
	
func on_restart():
	get_tree().reload_current_scene()

func add_cactus(pos):
	cactus_generator.add_cactus(pos)

func add_coconut_tree(pos):
	coconut_generator.add_coconut(pos)

# TODO: se colocar muitas nuvens, gerar chuva em excesso e causar inundação
func add_cloud_hot(pos):
	hot_generator.add_cloud(pos)

func add_cloud_cold(pos):
	cold_generator.add_cloud(pos)

func add_water_counter(value):
	water += value
	water_count.set_text(str(water))
	
func add_water():
	if estado == JOGANDO:
		var new_water = water_fragment.instance()
		new_water.position = (Vector2(rand_range(0, 800), 90))
		self.add_child(new_water)

func _on_limit_line_area_entered(area):
	estado = PERDENDO
	print("PERDEU, PLAYBOY")
	loser_panel_node.visible = true


func _on_Button_pressed():
	estado = PAUSADO
	dicas_panel_node.visible = true
	get_tree().paused = true


func _on_game_timer_timeout():
	if estado == JOGANDO:
		elapsed += 1
