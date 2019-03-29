extends Area2D

export(String, FILE, "*.tscn") var next_world_scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies() # creating variable which for when nodes overlap each other
	for body in bodies:
		if body.name == "player":
			Global.Player.take_damage(20) # if nodes are overlapping, health will reduce by amount 20
			#Global.Health.take_damage()
			get_tree().change_scene(next_world_scene) # changes scene to move to next scene in map
			
			
		