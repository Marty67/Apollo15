extends Area2D

const FIREBALL_SPEED = 350
var speed_x = 5
var speed_y = 5



func _ready():
	
	randomize()
	
	var x  = randi() %  10 + 1
	






	match x:

		10:
			speed_x = -5

		9:
			speed_x = -4

		8:
			speed_x = -3

		7:
			speed_x = -2

		6:
			speed_x = -1

		_:
			speed_x = x		
	
	

	
func _physics_process(delta):
	
	speed_y = 3
	
	
	


	
	
	
	var motion = Vector2(speed_x, speed_y) * FIREBALL_SPEED
	self.position = (self.position + motion * delta)
	
	
	
		
		
	
	
	
	
	
	
	
	
	




	
	


func _on_Area2D_body_entered(body):
	
	if body.name == "player":
		print("player hit")
		Global.Player.take_damage(5)
		Global.Player.burn()
		#self.queue_free()
	



func _on_Area2D_body_exited(body):
	if body.name == "player":
		get_node("burnTimer").start()
		
	
	


func _on_burnTimer_timeout():
	Global.Player.normal()
	
