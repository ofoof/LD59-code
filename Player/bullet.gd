extends RigidBody2D

var speed = 2000
var damage = 3
var colliders = []
# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported=10
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = Vector2(cos(rotation-PI/2)*speed,sin(rotation-PI/2)*speed)

func _on_body_entered(body):
	if body.get_collision_layer_value(3):
		queue_free()
	if body.get_collision_layer_value(4):
		#if colliders.has(body)!=true:
		#	colliders.resize(colliders.size()+1)
		#	colliders[colliders.size()-1] = body
		#	body.take_damage(3)
		deal_damage(body)
		queue_free()
func deal_damage(body):
	body.take_damage(damage)
	queue_free()
func _on_timer_timeout():
	queue_free()
