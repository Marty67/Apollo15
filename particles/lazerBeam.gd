extends Area2D

const LAZER_SPEED = 100
var speed_x = 5
var speed_y = 5



func _ready():
	Global.Lazer = self
	connect("body_entered",self,"body_entered")
	connect("body_exited",self,"body_exited")

func set_position(x,y):
	speed_x = x
	speed_y = y	

	
func _physics_process(delta):
	
	var motion = Vector2(speed_x, speed_y) * LAZER_SPEED
	self.position = (self.position + motion * delta)
	
	
	
	
	

	

func body_entered(body):

	for alien in get_tree().get_nodes_in_group("aliens"): 
		if body == alien:
			body.take_damage(5)
			body.modulate = Color8(0,255,0)
			
			#body.normal()
			
			

func body_exited(body):

	for alien in get_tree().get_nodes_in_group("aliens"):
		if body == alien:
			self.queue_free()
			body.modulate = Color8(255,255,255)
			

				
			
						
						
			
			
			
			



	
	
