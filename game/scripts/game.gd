extends Node2D

onready var cactus_generator = get_node("cactuses/cactuses_generator")
onready var coconut_generator = get_node("coconut_trees/coconut_generator")
onready var hot_generator = get_node("clouds/hot_generator")
onready var cold_generator = get_node("clouds/cold_generator")
onready var water_count = get_node("water_board/Control/Label")
onready var water_fragment = preload("res://scenes/water_fragment.tscn")
onready var loser_panel_node = get_node("loser_panel")
onready var dicas_panel_node = get_node("helper")
onready var deforesters_killed_label = get_node("deforesters_killed_board/deforesters_killed_ctrl/deforesters_killed_label")
onready var storm = preload("res://scenes/storm.tscn")
onready var inundation_timer = get_node("inundation/inundation_timer")
onready var thunder_timer = get_node("inundation/thunder_timer")
onready var thunderstorm = get_node("inundation/thunderstorm")
onready var footsteps_sfx = get_node("deforesters/footsteps")
#onready var hit_sfx = get_node("deforesters/hit")

var rng = RandomNumberGenerator.new()

var elapsed = 0

var deforesters_count = 0
var deforesters_created = 0
var hord_count = 0
var number_of_hords_to_win = 5

var cloud_counter = 0
var footstep_count = 0
#var hit_count = 0


var estado = 1
var card_selected = null

const JOGANDO = 1
const PERDENDO = 2
const PAUSADO = 3
const VENCEU = 4
const cloud_counter_limit = 5

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
	play_sounds()
	if hord_count >= number_of_hords_to_win && (deforesters_created - deforesters_count) < 1:
		you_won()

func on_restart():
	get_tree().reload_current_scene()

func add_cactus(pos, slot):
	cactus_generator.add_cactus(pos, slot)

func add_coconut_tree(pos, slot):
	coconut_generator.add_coconut(pos, slot)

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

func inundation():
	thunderstorm.play()
	thunder_timer.start()

func _on_inundation_timer_timeout():
	inundation()


func _on_thunder_timer_timeout():
	rng.randomize()
	var new_storm = storm.instance()
	new_storm.position = (Vector2(rng.randi_range(0,4)*100, 1))
	add_child(new_storm)
	inundation_timer.start()

func play(sound_name):
	if sound_name == "footsteps":
		footstep_count += 1
	#elif sound_name == "hit":
	#	hit_count += 1

func stop(sound_name):
	if sound_name == "footsteps":
		footstep_count -= 1
	#elif sound_name == "hit":
	#	hit_count -= 1

func play_sounds():
	if footstep_count > 0 && deforesters_created > 0:
		if !footsteps_sfx.playing:
			footsteps_sfx.play()
	else:
		footsteps_sfx.stop()
		
	#if hit_count > 0 && deforesters_created > 0:
	#	if !hit_sfx.playing:
	#		hit_sfx.play()
	#else:
	#	hit_sfx.stop()

func you_won():
	print("GG WP")
	$winner_panel.visible = true
	get_tree().paused = true

func _on_btn_play_again_pressed():
	on_restart()
