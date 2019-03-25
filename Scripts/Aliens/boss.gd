extends KinematicBody2D


var health = 350
var DAMAGE = 2
const TYPE = "BOSS"
var hitstun = 0
var movedir = Vector2(0,0)
var knockdir = Vector2(0,0) 




var can_shoot = true

const FIREBALL_SCENE = preload("res://particles/fireball.tscn")
const FIREBALL_SCENE2 = preload("res://particles/fireball2.tscn")

const SPEED = 100
onready var hand1 = get_node("hand1")
onready var hand2 = get_node("hand2")
	

func _ready():
	Global.Boss = self
	$anim.play("ready")
	var distance_to_player = self.position.distance_to(Global.Player.position)
	print(str(distance_to_player))


	
func _physics_process(delta):
	for area in $hitbox.get_overlapping_areas():
		
		
		  
		var body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			if TYPE == "PLAYER":
				take_dmg(body.get("DAMAGE"))
			
			if TYPE == "BOSS" and hitstun > 0:
				get_node("sprite").modulate = Color8(255,0,0)
				health -= body.get("DAMAGE")
				hitstun -=1
				
			else:
				get_node("sprite").modulate = Color8(0,0,0)	
			hitstun = 10 
			
	


		
	
	
	

func _on_Timer_timeout():
	
	
	
	if can_shoot == true:
		var fireball = FIREBALL_SCENE.instance()
		get_parent().add_child(fireball)
		fireball.global_position = hand1.global_position
		
		
	if can_shoot == true:
		var fireball2 = FIREBALL_SCENE2.instance()
		get_parent().add_child(fireball2)
		fireball2.global_position = hand2.global_position
 	
	

	


func _on_transformTimer_timeout():
	$anim.play("transform")

