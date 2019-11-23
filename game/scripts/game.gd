extends Node2D

onready var cactus_generator = get_node("cactuses/cactuses_generator")
onready var water_count = get_node("water_board/Control/Label")

var estado = 1
var card_selected = false

const JOGANDO = 1
const PERDENDO = 2

var water = 250

func _ready():
	water_count.set_text(str(water))
	pass

func add_cactus(pos):
	cactus_generator.add_cactus(pos)
	
func add_water_counter(value):
	water += value
	water_count.set_text(str(water))
	