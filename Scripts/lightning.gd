extends Area2D

var damage_player = false
var damage_alien = false
var timer

 




func _ready():
	connect("body_entered",self,"body_entered")
	connect("body_exited",self,"body_exited")
	
	timer = get_node("Timer")
	
	
	
    


func body_entered(body):
	if body.name ==  "player":
		damage_player = true
		
		
#	if body.name == "Alien":
#		damage_alien = true	
		
	
	
	
	
func _physics_process(delta):
	
	if damage_player == true:
		Global.Player.take_damage(0.1)
		Global.Player.burn()
		
		
#	if damage_alien == true:
#		Global.Alien.take_damage(0.2)


func body_exited(body):
	
	
	if body.name ==  "player":
		damage_player = false
		
		
		timer.start()
		
		
		
		
#	if body.name == "Alien":
#		damage_alien = false
		






func _on_Timer_timeout():
	Global.Player.normal()
	
