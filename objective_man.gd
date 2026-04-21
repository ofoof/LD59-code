extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$bottom_thing.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.get_collision_layer_value(1):
		$bottom_thing.visible = true
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(2).timeout
		queue_free()
