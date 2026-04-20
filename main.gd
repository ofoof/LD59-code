extends Node2D

@export var Generator: PackedScene
var player
var radar
var generator
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	radar = get_tree().get_first_node_in_group("Radar")
	$UI/GameOver.visible = false
	$UI/TimeLeft.visible = false
	player.active_input = false

func _process(delta):
	var time_left = $GameTimer.time_left
	var minutes = (int(time_left) % 3600) / 60
	var seconds = int(time_left) % 60
	time_left = "%02d:%02d" % [minutes,seconds]
	$UI/TimeLeft.text = time_left

func create_generation():
	if generator:
		remove_generation()
	generator = Generator.instantiate()
	add_child.call_deferred(generator)
	radar.reset_radar()

func remove_generation():
	generator.queue_free()

func _on_button_pressed():
	create_generation()
	$UI/StartButton.visible = false
	await get_tree().create_timer(3.0).timeout
	if $GameTimer.time_left == 0:
		$GameTimer.start()
	$UI/Transition.visible = false
	$UI/TimeLeft.visible = true
	player.active_input=true

func change_map():
	player.active_input=false
	player.health=player.MAX_HEALTH
	player.take_damage(0)
	player.bullets=player.max_bullets
	player.update_bullets()
	remove_generation()
	$UI/Transition.visible = true
	$UI/StartButton.visible = true
	$UI/TimeLeft.visible = false


func _on_game_timer_timeout() -> void:
	game_over("Time")
	
func game_over(type):
	$UI/GameOver.visible = true
	$UI/GameOver/GO2.text = type
	player.active_input=false
