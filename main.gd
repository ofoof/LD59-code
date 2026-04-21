extends Node2D

@export var Generator: PackedScene
var player
var radar
var generator
var room_found = []
var room_scores = []
var game_is_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")
	radar = get_tree().get_first_node_in_group("Radar")
	$UI/GameOver.visible = false
	$UI/TimeLeft.visible = false
	$UI/Transition.visible = false
	$UI/ContinueButton.visible = false
	player.active_input = false
	get_viewport().get_window().unresizable = true

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
	$UI/Start_screen.visible = false
	$UI/ContinueButton.visible = false
	$UI/Loader1.visible = true
	await get_tree().create_timer(3.0).timeout
	if $GameTimer.time_left == 0:
		$GameTimer.start()
	$GameTimer.paused = false
	$UI/Transition.visible = false
	$UI/Loader1.visible = false
	$UI/TimeLeft.visible = true
	player.active_input=true
	
func get_score(room):
	return float(room[0]*200-room[0]*20*room[1]+clamp(int(player.health/2),0,100))

func add_score_room():
	var found_num = 0
	var left_num = 0
	var adders = []
	if len(room_found)>0:
		for room_dat in room_found:
			found_num += room_dat[0]
			left_num += room_dat[1]
			adders.append([radar.found-found_num,radar.left-left_num])
		for adds in adders:
			room_found.append(adds)
	else:
		room_found.append([radar.found,radar.left])
	room_scores.append(get_score(room_found[len(room_found)-1]))
	

func change_map():
	add_score_room()
	$UI/Transition/Score_rooms.text = "Room Score: " + str(int(room_scores[len(room_scores)-1]))
	$UI/Transition/Subscore_rooms.text = "Beacons found = "+str(int(room_found[len(room_found)-1][0]))+" * 100 points\nBeacons remaining = -10% * "+str(int(room_found[len(room_found)-1][1]))+" each\nHealth bonus: "+str(clamp(int(player.health/2),0,100))
	
	player.active_input=false
	player.health=player.MAX_HEALTH
	player.take_damage(0)
	player.bullets=player.max_bullets
	player.update_bullets()
	remove_generation()
	$UI/Transition.visible = true
	$UI/ContinueButton.visible = true
	$UI/TimeLeft.visible = false
	$GameTimer.paused = true


func _on_game_timer_timeout() -> void:
	game_over("Time")
	
func game_over(type):
	if !game_is_over:
		game_is_over = true
		$UI/GameOver.visible = true
		$UI/GameOver/GO2.text = type
		add_score_room()
		var total_score = 0
		var all_rooms = []
		for i in len(room_scores):
			total_score+=room_scores[i]
			all_rooms.append("Room "+str(i+1)+": "+str(int(room_scores[i])))
		$UI/GameOver/GO3.text = "Total points: "+str(total_score)
		var rooms_text = "\n".join(all_rooms)
		$UI/GameOver/GO4.text = rooms_text
		player.active_input=false
