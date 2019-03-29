extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var timer

func _ready():
	Global.GameState.showTask()
	timer = get_node("Timer")	
	timer.start()
	


func _on_Timer_timeout():
	Global.GameState.hideTask()
	timer.stop()
	
	
	
	
	
