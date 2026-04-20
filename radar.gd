extends Node2D


# Called when the node enters the scene tree for the first time.
var generator: Node2D
func _ready():
	generator = get_tree().get_first_node_in_group("Generator")
	await get_tree().create_timer(1.0).timeout
	generator.load_ends(5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
