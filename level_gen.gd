extends Node2D

var grid_avail = [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
				[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],]
var grid = [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
			[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]]
var bounds = [19,19]
			
const TILE_SIZE=780

@export var HallH: Array[PackedScene] = []
@export var HallV: Array[PackedScene] = []
@export var Cross: Array[PackedScene] = []
@export var THall0: Array[PackedScene] = []
@export var THall1: Array[PackedScene] = []
@export var THall2: Array[PackedScene] = []
@export var THall3: Array[PackedScene] = []
@export var Elbow0: Array[PackedScene] = []
@export var Elbow1: Array[PackedScene] = []
@export var Elbow2: Array[PackedScene] = []
@export var Elbow3: Array[PackedScene] = []
@export var EndRoom: Array[PackedScene] = []
@export var ObjectiveRooms: Array[PackedScene] = []

var Cross_tag
var HallH_tag
var HallV_tag
var THall0_tag
var THall1_tag
var THall2_tag
var THall3_tag
var Elbow0_tag
var Elbow1_tag
var Elbow2_tag
var Elbow3_tag
var EndRoom_tag

@export var Airlock: PackedScene

var Ends = []
# Called when the node enters the scene tree for the first time.
func _ready():
	Cross_tag = ["Cross",Cross]
	HallH_tag = ["HallH",HallH]
	HallV_tag = ["HallV",HallV]
	THall0_tag = ["THall0",THall0]
	THall1_tag = ["THall1",THall1]
	THall2_tag = ["THall2",THall2]
	THall3_tag = ["THall3",THall3]
	Elbow0_tag = ["Elbow0",Elbow0]
	Elbow1_tag = ["Elbow1",Elbow1]
	Elbow2_tag = ["Elbow2",Elbow2]
	Elbow3_tag = ["Elbow3",Elbow3]
	EndRoom_tag = ["EndRoom",EndRoom]
	
	var player = get_tree().get_first_node_in_group("Player")
	
	var placement
	var placements = [Cross_tag,HallH_tag,HallV_tag]
	var rand_placement = placements[randi_range(0,2)]
	var placement_position = [9,9]
	grid_avail[placement_position[0]][placement_position[1]]=true
	grid[placement_position[0]][placement_position[1]]=rand_placement[0]
	placement = rand_placement[1].pick_random().instantiate()
	placement.position = Vector2(placement_position[0]*TILE_SIZE,placement_position[1]*TILE_SIZE)
	get_tree().current_scene.add_child.call_deferred(placement)
	
	if player:
		player.position=Vector2(placement_position[0]*TILE_SIZE,placement_position[1]*TILE_SIZE)
	place_tile_string(rand_placement,placement_position,15)
	place_tile_string(rand_placement,placement_position,15)
	
	for i in range(4):
		var new_tile = get_used_tiles().pick_random()
		place_tile_string(grid[new_tile[0]][new_tile[1]],new_tile,10)
	for i in range(bounds[0]):
		for j in range(bounds[1]):
			if [i,j] in get_used_tiles():
				print("force attempt "+str(i)+""+str(j))
				force_room([i,j],[Elbow0_tag,Elbow1_tag,Elbow2_tag,Elbow3_tag,HallH_tag,HallV_tag,HallH_tag,HallV_tag])
	#for i in range(20):
	#	var new_tile = get_used_tiles().pick_random()
	#	place_tile_string(grid[new_tile[0]][new_tile[1]],new_tile,10)
	for i in range(bounds[0]):
		for j in range(bounds[1]):
			if [i,j] in get_used_tiles():
				force_cap([i,j])			
	airlock_fill()
	if get_tree().get_first_node_in_group("Radar"):
		print("radar active")
		#load_ends(2)
	else:
		load_ends(0)
	
func place_tile_string(start_tile,start_position,string_length):
	var placement
	var place_from = start_tile
	var place_fl = start_position
	for i in range(string_length):
		var new_placement = get_next_placement(place_from, place_fl)
		var tries=0
		while !new_placement and tries<3:
			new_placement = get_next_placement(place_from, place_fl)
			tries+=1
		if new_placement:
			place_fl = [new_placement[1][0],new_placement[1][1]]
			placement = place_tile(new_placement[0],place_fl,0)
			place_from=new_placement[0]
	force_cap(place_fl)

func get_next_placement(placement, placement_position):
	var placements
	var new_position
	var pos_loc
	var max_choices
	var next_placement
	var looked
	
	looked = type_lookup(placement[0])
	if !looked:
		return
	var available = available_rooms(placement_position)	
	if available:
		var empty_positions = []
		for i in range(len(looked[0])):
			print(str([placement_position[0]+looked[1][i][0],placement_position[1]+looked[1][i][1]])+"checker")
			for j in range(len(available)):
				print(available[j])
				if [placement_position[0]+looked[1][i][0],placement_position[1]+looked[1][i][1]] == available[j]:
					empty_positions.append(looked[0][i])
		pos_loc = empty_positions.pick_random()
	#	if !pos_loc:
	#		print("failure"+str(placement_position))
	#		print(pos_loc)
	#		return
		new_position = [placement_position[0]+looked[1][pos_loc][0],placement_position[1]+looked[1][pos_loc][1]]
		
		if looked[1][pos_loc][0]==1:
			placements = [Cross_tag,Cross_tag,HallH_tag,HallH_tag,HallH_tag,Elbow0_tag,Elbow1_tag,THall0_tag,THall1_tag,THall2_tag]
		if looked[1][pos_loc][0]==-1:
			placements = [Cross_tag,Cross_tag,HallH_tag,HallH_tag,HallH_tag,Elbow2_tag,Elbow3_tag,THall0_tag,THall3_tag,THall2_tag]
		if looked[1][pos_loc][1]==-1:
			placements = [Cross_tag,Cross_tag,HallV_tag,HallV_tag,HallV_tag,Elbow0_tag,Elbow3_tag,THall0_tag,THall1_tag,THall3_tag]
		if looked[1][pos_loc][1]==1:
			placements = [Cross_tag,Cross_tag,HallV_tag,HallV_tag,HallV_tag,Elbow2_tag,Elbow1_tag,THall3_tag,THall1_tag,THall2_tag]
	
		max_choices = len(placements)-1
		if new_position[0]>bounds[0] or new_position[0]<0 or new_position[1]>bounds[1] or new_position[1]<0:
			return
		if grid_avail[new_position[0]][new_position[1]]==false:
			next_placement=[placements[randi_range(0,max_choices)],new_position]
			grid_avail[new_position[0]][new_position[1]]=true
			grid[new_position[0]][new_position[1]]=next_placement[0][0]
			return next_placement

func force_room(new_position,tiles):
	var rooms = []
	print(new_position)
	if available_rooms(new_position):
		var empty_location = available_rooms(new_position).pick_random()
		if empty_location:
			var placements
			var direction = [new_position[0]-empty_location[0],new_position[1]-empty_location[1]]
			if direction == [-1,0]:
				placements = [Cross_tag,Cross_tag,HallH_tag,HallH_tag,HallH_tag,Elbow0_tag,Elbow1_tag,THall0_tag,THall1_tag,THall2_tag]
			if direction == [1,0]:
				placements = [Cross_tag,Cross_tag,HallH_tag,HallH_tag,HallH_tag,Elbow2_tag,Elbow3_tag,THall0_tag,THall3_tag,THall2_tag]
			if direction == [0,1]:
				placements = [Cross_tag,Cross_tag,HallV_tag,HallV_tag,HallV_tag,Elbow0_tag,Elbow3_tag,THall0_tag,THall1_tag,THall3_tag]
			if direction == [0,-1]:
				placements = [Cross_tag,Cross_tag,HallV_tag,HallV_tag,HallV_tag,Elbow2_tag,Elbow1_tag,THall3_tag,THall1_tag,THall2_tag]
			for tile in tiles:
				if tile in placements:
					rooms.append(tile)
			var room = rooms.pick_random()
			place_tile(room,empty_location,0)
			grid[empty_location[0]][empty_location[1]]=room[0]
			grid_avail[empty_location[0]][empty_location[1]]=true
		
func force_cap(new_position):
	var room = EndRoom_tag
	if available_rooms(new_position):
		var empty_location = available_rooms(new_position).pick_random()
		if empty_location:
			var direction = [new_position[0]-empty_location[0],new_position[1]-empty_location[1]]
			if direction == [0,1]:
				place_tile(room,empty_location,0)
			if direction == [0,-1]:
				place_tile(room,empty_location,PI)
			if direction == [-1,0]:
				place_tile(room,empty_location,PI/2)
			if direction == [1,0]:
				place_tile(room,empty_location,3*PI/2)
			grid[empty_location[0]][empty_location[1]]=room[0]
			grid_avail[empty_location[0]][empty_location[1]]=true
	
func type_lookup(type):
	if type == "HallH":
		return [[0,1],[[-1,0],[1,0]]]
	if type == "HallV":
		return [[0,1],[[0,-1],[0,1]]]
	elif type == "Cross":
		return [[2,3,0,1],[[0,1],[0,-1],[-1,0],[1,0]]]
	elif type == "EndRoom":
		return [[-1],[[0,0]]]
	elif type == "Elbow0":
		return [[0,1],[[-1,0],[0,1]]]
	elif type == "Elbow1":
		return [[0,1],[[-1,0],[0,-1]]]
	elif type == "Elbow2":
		return [[0,1],[[1,0],[0,-1]]]
	elif type == "Elbow3":
		return [[0,1],[[1,0],[0,1]]]
	elif type == "THall0":
		return[[0,1,2],[[1,0],[-1,0],[0,1]]]
	elif type == "THall1":
		return[[0,1,2],[[0,-1],[-1,0],[0,1]]]
	elif type == "THall2":
		return[[0,1,2],[[1,0],[-1,0],[0,-1]]]
	elif type == "THall3":
		return[[0,1,2],[[1,0],[0,-1],[0,1]]]
	else:
		return

func get_used_tiles():
	var tiles = []
	for i in range(bounds[0]):
		for j in range(bounds[1]):
			if grid_avail[i][j]!=false:
				tiles.append([i,j])
	return tiles
	
func available_rooms(new_position):
	var type=grid[new_position[0]][new_position[1]]
	var checker = type_lookup(type)
	var rooms = []
	if checker:
		for doors in len(checker[0]):
			var room_pos = [new_position[0]+checker[1][doors][0],new_position[1]+checker[1][doors][1]]
			if room_pos[0]>bounds[0] or room_pos[0]<0 or room_pos[1]>bounds[1] or room_pos[1]<0:
				continue
			if grid_avail[room_pos[0]][room_pos[1]]==false:
				rooms.append([new_position[0]+checker[1][doors][0],new_position[1]+checker[1][doors][1]])
		return rooms
			
func place_tile(type,new_position,new_rotation):
	if type[0] == "EndRoom":
		Ends.append([type,new_position,new_rotation,0])
	else:
		var new_tile=type[1].pick_random().instantiate()
		new_tile.position = Vector2(new_position[0]*TILE_SIZE,new_position[1]*TILE_SIZE)
		new_tile.rotation = new_rotation
		get_tree().current_scene.add_child.call_deferred(new_tile)
		return new_tile

func load_ends(objectives):
	var Objected = []
	for i in range(objectives):
		if len(Ends)>0:
			var random = randi_range(0,len(Ends)-1)
			Objected.append(Ends[random])
			Ends.remove_at(random)
	for end_room in Ends:
		var new_tile=end_room[0][1].pick_random().instantiate()
		new_tile.position = Vector2(end_room[1][0]*TILE_SIZE,end_room[1][1]*TILE_SIZE)
		new_tile.rotation = end_room[2]
		get_tree().current_scene.add_child.call_deferred(new_tile)
	for obj_room in Objected:
		print(obj_room)
		var new_tile=ObjectiveRooms.pick_random().instantiate()
		new_tile.position = Vector2(obj_room[1][0]*TILE_SIZE,obj_room[1][1]*TILE_SIZE)
		new_tile.rotation = obj_room[2]
		get_tree().current_scene.add_child.call_deferred(new_tile)

func airlock_fill():
	for i in range(bounds[0]-1):
		for j in range(bounds[1]):
			if grid_avail[i][j]==true and grid_avail[i+1][j]==true:
				var tile_connection_1 = false
				var tile_connection_2 = false
				for connections in type_lookup(grid[i][j])[1]:
					if connections[0] == 1:
						tile_connection_1 = true
				for connections in type_lookup(grid[i+1][j])[1]:
					if connections[0] == -1:
						tile_connection_2 = true
				if tile_connection_1 and tile_connection_2:
					var new_airlock = Airlock.instantiate()
					new_airlock.position = Vector2((i+.5)*TILE_SIZE,j*TILE_SIZE)
					get_tree().current_scene.add_child.call_deferred(new_airlock)
	for i in range(bounds[0]):
		for j in range(bounds[1]-1):
			if grid_avail[i][j]==true and grid_avail[i][j+1]==true:
				var tile_connection_1 = false
				var tile_connection_2 = false
				for connections in type_lookup(grid[i][j])[1]:
					if connections[1] == 1:
						tile_connection_1 = true
				for connections in type_lookup(grid[i][j+1])[1]:
					if connections[1] == -1:
						tile_connection_2 = true
				if tile_connection_1 and tile_connection_2:
					var new_airlock = Airlock.instantiate()
					new_airlock.position = Vector2(i*TILE_SIZE,(j+.5)*TILE_SIZE)
					new_airlock.rotation = PI/2
					get_tree().current_scene.add_child.call_deferred(new_airlock)			
