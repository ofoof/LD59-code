extends CharacterBody2D

@export var health_max = 12
@export var health_min = 6
@export var speed_mod = 80
@export var speed_max = 1.6
@export var speed_min = 0.8
@export var DETECTION_RANGE = 400
@export var split_on_death = false
@export var rotate_to_player = true
@export var perma_lock = false
@export var damage_range: Array[int] = [3,8]
var movement_target_position: Vector2
var health
var movement_speed
var splited = 0

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
var player: Node2D
var goto: Vector2

func _ready():
	health = randi_range(health_min,health_max)
	movement_speed = randf_range(speed_min,speed_max)*speed_mod
	scale = Vector2(scale.x*randf_range(.8,1.2),scale.y*randf_range(.8,1.2))
	
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	actor_setup.call_deferred()
	player = get_tree().get_first_node_in_group("Player")
	movement_target_position = global_position
	goto = movement_target_position
	set_movement_target(movement_target_position)

func _process(delta):
	if player:
		movement_target_position = player.global_position
		if (player.global_position-global_position).length()<DETECTION_RANGE:
			if rotate_to_player:
				global_rotation = global_position.angle_to_point(player.global_position)
			movement_target_position=player.global_position
			goto = movement_target_position
			set_movement_target(goto)
		else:
			if !perma_lock:
				set_movement_target((goto+global_position)/2)
		if rotate_to_player:
			if player.global_position.x < global_position.x:
				$Sprite2D.flip_v=true
			else:
				$Sprite2D.flip_v=false
	else:
		movement_target_position=global_position
		set_movement_target(movement_target_position)

func actor_setup():
	await get_tree().physics_frame
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	var collision = move_and_collide(velocity*delta)
	if collision:
		var collider = collision.get_collider()
		if collider.get_collision_layer_value(1):
			var damage = randi_range(damage_range[0],damage_range[1])
			collider.take_damage(damage)

func take_damage(damage):
	health-=damage
	if health<=0:
		if !split_on_death:
			queue_free()
		else:
			if get_parent().name == "AlienSpawner":
				if health_max>6&&splited<2:
					get_parent().cause_split(position,1,self,3)
				else:
					queue_free()
			else:
				queue_free()

func _on_area_2d_body_entered(body):
	if body.name == "Bullet":
		body.deal_damage(self)
		body.queue_free()
	if body.get_collision_layer_value(1):
			var damage = randi_range(damage_range[0],damage_range[1])
			body.take_damage(damage)
