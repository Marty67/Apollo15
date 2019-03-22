extends Node



export(String, FILE, "*.tscn") var START  # this allows maploader to setup which scene to first load and can be changed anytime.


var map
var spawned = false
onready var player = $player #this gets the player node ready for use.
#var alien = preload("res://Scenes/Character/Heydies.tscn").instance()

func initialize(): # this method removes the instance of player on the maploader node.
	remove_child(player)
  
	
	change_map(START)
	
func change_map(scene_path):
	
	var playerSpawn
	var current_scene
	
	
	#$AlienTimer.start()  
	
	#var current_map
	
	# this method is used when changing rooms /changing scenes  including loading first map.
	
	if map:
		     # a map's player instance  is removed from map before removing map instance and changing scene.
		map.remove_child(player)
		current_scene = map.get_name()
		remove_child(map)
		map.queue_free()
	
	$FadeIn.show()
	$FadeIn.fade_in()	
	map = load(scene_path).instance()
	#print(str(map))
	
	 
	#print(current_scene)
	
		
		# new room/map/scene is added and then same instance of   player is  added.
		#carrying over the instance  allows data to be carried over so for example players health and oxygen arent reset to defaults.
		
	add_child(map)
	
#	for position in get_tree().get_nodes_in_group("spawnPoints"):
	
	if current_scene == "zeus-cave2" or current_scene == "poseidon-cave1":
		playerSpawn = map.get_node("playerSpawnPoint2")
		
	elif current_scene =="poseidon-cave3":
		playerSpawn = map.get_node("playerSpawnPoint3")	
		
		
		
	else:
		playerSpawn = map.get_node("playerSpawnPoint")     # stores spawnpoint node which is a position2D node which  has been placed on maps.
	
	map.add_child(player)
	
	player.global_position = playerSpawn.global_position # after adding player instance on map this changes players position to spawnpoint position.
	
	
	

	
	
#func get_maps():
#	var maps = []
#
#	for Map in get_tree().get_nodes_in_group("maps"):
#		maps.append(Map)
#
#	return maps		
#
	
	
	
	# this function sets up a array which contains doors in a certain room/map/scene.
	# so in each room this function is run once to see how much doors there are and then they are connected to rooms in maingame node.
	
func get_doors():
	var doors = []
	for door in get_tree().get_nodes_in_group("doors"):
		if not map.is_a_parent_of(door):
			continue
		doors.append(door)
	print(doors.size())	
	return doors
	



##func _on_Timer_timeout():
#	for maps in get_maps():
#		if maps.has_node("AlienSpawnPoint"):
#			maps.add_child(alien)
#
#			var alienSpawn =  map.get_node("AlienSpawnPoint")
#			alien.global_position = alienSpawn.global_position
#			$AlienTimer.stop()
#
