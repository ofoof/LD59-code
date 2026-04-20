extends Node2D

@export var Generator: PackedScene
var player
var radar
var generator
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	radar = get_tree().get_first_node_in_group("Radar")

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
	$UI/Button.visible = false
	await get_tree().create_timer(3.0).timeout
	$UI.visible = false
	$UI/Transition.visible = false

func change_map():
	player.health=player.MAX_HEALTH
	player.take_damage(0)
	player.bullets=player.max_bullets
	player.update_bullets()
	remove_generation()
	$UI.visible = true
	$UI/Transition.visible = true
	$UI/Button.visible = true
