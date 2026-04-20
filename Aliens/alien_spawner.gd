extends Node2D

@export var aliens: Array[PackedScene]
@export var alien_list: Array[PackedScene]
@export var chance = 100
@export var new_scale = 0.3
# Called when the node enters the scene tree for the first time.
func _ready():
	if randi_range(0,100)<chance:
		var new_alien = aliens.pick_random().instantiate()
		new_alien.position = position
		new_alien.rotation = rotation
		new_alien.scale = scale*new_scale
		self.add_child.call_deferred(new_alien)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func cause_split(new_position,alien_type,alien,splits):
	for i in range(splits):
		var new_alien = alien_list[alien_type].instantiate()
		new_alien.position = Vector2(new_position.x+randf_range(-50,50),new_position.y+randf_range(-50,50))
		new_alien.rotation = rotation
		new_alien.scale = alien.scale/2
		new_alien.health_min = alien.health_min/3
		new_alien.health_max = alien.health_min
		new_alien.speed_mod = alien.speed_mod*1.75
		new_alien.splited = alien.splited+1
		self.add_child.call_deferred(new_alien)
		alien.queue_free()
	
