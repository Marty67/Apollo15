extends Node2D

# This is the script use to load the first map which is Heydies onto the screen

var alien = preload("res://Scenes/Character/Heydies.tscn").instance()



func _ready(): #function to add the scene to the global node
	if(Global.GameState.getLength() <=0):
		add_child(alien)
		Global.GameState.addAlien()

		
      