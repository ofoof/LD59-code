extends CharacterBody2D


const ACCEL = 1000.0
const MAX_SPEED = 300.0
const FRICTION = 1000.0
const TURN_SPEED = 5.0
var health = 5.0
var MAX_HEALTH = 5.0
var zoomed = false
@export var bullet: PackedScene
var GUI

func _ready():
	GUI = get_tree().get_first_node_in_group("GUI")

func _physics_process(delta):
	var direction = Input.get_vector("Left", "Right","Up", "Down")
	if direction.length()!=0:
		velocity += Vector2.ZERO.direction_to(direction) * ACCEL * delta
		velocity = velocity.clampf(-MAX_SPEED,MAX_SPEED)
		if velocity.length()>MAX_SPEED:
			velocity = velocity.normalized()*MAX_SPEED
		$AnimatedSprite2D.play("Walk")
		if $SoundTimer.time_left==0:
			$AudioStreamPlayer2D.play()
			$SoundTimer.start()
	else:
		$AnimatedSprite2D.play("Idle")
	if direction.x==0:
		velocity.x = move_toward(velocity.x, 0, FRICTION*delta)
	if direction.y==0:
		velocity.y = move_toward(velocity.y, 0, FRICTION*delta)
	var mouse = get_global_mouse_position()
	rotation = rotate_toward(rotation,position.angle_to_point(mouse)+PI/2,(abs(rotation-(position.angle_to_point(mouse)+PI/2))*3)*TURN_SPEED*delta)
	move_and_slide()
	
	if Input.is_action_pressed("Interact1"):
		shoot()
	if Input.is_action_pressed("Interact2"):
		if $ZoomTimer.time_left==0:
			if zoomed:
				zoomed = false
				$Camera2D.zoom = Vector2(1,1)
			else:
				zoomed = true
				$Camera2D.zoom = Vector2(0.05,0.05)
			$ZoomTimer.start()

func shoot():
	if $CooldownTimer.time_left<=0:
		var newBullet = bullet.instantiate()
		newBullet.position = position
		newBullet.rotation = rotation
		get_tree().current_scene.add_child(newBullet)
		$CooldownTimer.start()
func take_damage(damage):
	if $HitCooldown.time_left<=0:
		health-=damage
		if health==0:
			print("died")
		if GUI:
			if GUI.get_child(0):
				GUI.get_child(0).text=str(roundi((health/MAX_HEALTH)*100))+"%"
		$HitCooldown.start()
