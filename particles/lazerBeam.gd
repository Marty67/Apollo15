extends Area2D

const LAZER_SPEED = 100
var speed_x = 5
var speed_y = 5



func _ready():
	Global.Lazer = self

func set_position(x,y):
	speed_x = x
	speed_y = y	

	
func _physics_process(delta):
	
	var motion = Vector2(speed_x, speed_y) * LAZER_SPEED
	self.position = (self.position + motion * delta)
	
	
	
	
	

	
#
#func _on_lazer_body_entered(body):
#
#	if body.name == "alien" or body.name =="BOSS":
#		body.take_damage(5)
#		self.queue_free()
#		#body.get_node("sprite").modulate = Color8(255,0,0)
		


#func _on_lazer_body_exited(body):
#	if body.name == "alien":
#		self.queue_free()
	