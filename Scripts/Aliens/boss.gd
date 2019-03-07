extends KinematicBody2D


var health = 350


#var distance_to_player = self.position.distance_to(Global.Player.position)

var can_shoot = true

const FIREBALL_SCENE = preload("res://particles/fireball.tscn")
const SPEED = 100
onready var mouth = get_node("mouth")
	

func _ready():
	Global.Boss = self
	$anim.play("ready")


	
#func _physics_process(delta):
	
#	distance_to_player = self.position.distance_to(Global.Player.position)
	
	
	
#
#	if distance_to_player > 200 and distance_to_player < 350:
#		can_shoot = true
		
	
	
	

func _on_Timer_timeout():
	
	if can_shoot == true:
		var fireball = FIREBALL_SCENE.instance()
		get_parent().add_child(fireball)
		fireball.global_position = mouth.global_position
	

	


func _on_transformTimer_timeout():
	$anim.play("transform")

