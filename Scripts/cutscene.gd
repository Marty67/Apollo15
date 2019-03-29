extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var can travel = false


func _ready():
	Global.Ship = self
	
#	timer = Timer.new()
#	timer.set_wait_time(2)#91
#	timer.connect("timeout",self,"loadScene")
#	add_child(timer)
#	timer.start()
	
	
func loadScene():

	get_tree().change_scene("res://MainGame.tscn")	
	

func _process(delta):
	if travel == true:
		$travel.show()
		$travel.play()
		
		
func travelt		
	
	
