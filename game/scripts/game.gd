extends Node2D

onready var cactus_generator = get_node("cactuses/cactuses_generator")
onready var hot_generator = get_node("clouds/hot_generator")
onready var cold_generator = get_node("clouds/cold_generator")
onready var water_generator = get_node("water_fragments/water_generator")
onready var water_count = get_node("water_board/Control/Label")
onready var water_fragment = preload("res://scenes/water_fragment.tscn")
onready var loser_panel_node = get_node("loser_panel")

var estado = 1
var card_selected = null

const JOGANDO = 1
const PERDENDO = 2

var water = 250

func _ready():
	water_count.set_text(str(water))
	
func on_restart():
	get_tree().reload_current_scene()

func add_cactus(pos):
	cactus_generator.add_cactus(pos)

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
