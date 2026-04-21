extends Node2D


# Called when the node enters the scene tree for the first time.
var generator: Node2D
@export var tracker: PackedScene
var trackers = []
var tile_size = 0
var track_dist = 100
var dial_size = 400
var found = 0
var left = 0
var start_locator
var start_pos = [0,0]
func _ready():
	pass
	#await get_tree().create_timer(1.0).timeout
	#generator = get_tree().get_first_node_in_group("Generator")
	#if generator:
		#tile_size = generator.TILE_SIZE
		#await get_tree().create_timer(1.0).timeout
		#var tiles = generator.Ends
		#var obj = clamp(floor(len(tiles)/3),2,5)
		#print(len(tiles))
		#print(obj)
		#var locations = generator.load_ends(obj)
		#for location in locations:
			#var new_tracker = tracker.instantiate()
			#trackers.append([new_tracker,location[1]])
			#new_tracker.position = Vector2.ZERO
			#get_child(0).get_child(0).add_child.call_deferred(new_tracker)
	#start_locator = tracker.instantiate()
	#if generator:
		#start_pos = generator.Start_pos
		#start_locator.position = Vector2.ZERO
		#start_locator.self_modulate = Color("31c766")
		#get_child(0).get_child(0).add_child.call_deferred(start_locator)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if trackers:
		for next_tracker in trackers:
			next_tracker[0].position = (Vector2(next_tracker[1][0],next_tracker[1][1])-(global_position/tile_size))*track_dist
			if next_tracker[0].position.length()>dial_size:
				next_tracker[0].position = next_tracker[0].position.normalized()*dial_size
			if next_tracker[0].position.length()<25:
				next_tracker[0].queue_free()
				trackers.erase(next_tracker)
				found += 1
				left -= 1
				change_found(found)
	if start_locator:
		start_locator.position = (Vector2(start_pos[0],start_pos[1])-(global_position/tile_size))*track_dist
		if start_locator.position.length()>dial_size:
				start_locator.position = start_locator.position.normalized()*dial_size
	get_child(0).get_child(0).get_child(0).rotation = get_parent().rotation+PI

func change_found(amount):
	$CanvasLayer/Label.text = str(amount)

func reset_radar():
	for tracker in trackers:
		tracker[0].queue_free()
		tracker[1] = []
	trackers = []
	if start_locator:
		start_locator.queue_free()
		
	await get_tree().create_timer(1.0).timeout
	generator = get_tree().get_first_node_in_group("Generator")
	if generator:
		tile_size = generator.TILE_SIZE
		var tiles = generator.Ends
		var obj = clamp(floor(len(tiles)/3)+1,2,5)
		left += obj
		var locations = generator.load_ends(obj)
		for location in locations:
			var new_tracker = tracker.instantiate()
			trackers.append([new_tracker,location[1]])
			new_tracker.position = Vector2.ZERO
			get_child(0).get_child(0).add_child.call_deferred(new_tracker)
	start_locator = tracker.instantiate()
	if generator:
		start_pos = generator.Start_pos
	start_locator.position = Vector2.ZERO
	start_locator.self_modulate = Color("31c766")
	get_child(0).get_child(0).add_child.call_deferred(start_locator)
