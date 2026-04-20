extends Node2D


# Called when the node enters the scene tree for the first time.
var can_run = false
func _ready():
	pass # Replace with function body.
	$SpawnTimer.start()
	$TransportArea.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	$TransportArea.visible = true
	can_run = true

func _on_area_2d_body_entered(body):
	if body.get_collision_layer_value(1) and can_run:
		print("beam me up scotty")
		get_tree().current_scene.change_map()
