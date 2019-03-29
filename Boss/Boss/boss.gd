extends KinematicBody2D

const DAMAGE = 50

var health = 50#350
var DAMAGE = 2
const TYPE = "BOSS"
var hitstun = 0
var movedir = Vector2(0,0)
var knockdir = Vector2(0,0) 
var speed = 0

var texture_default = null
var texture_hurt = null




var can_shoot = true

const FIREBALL_SCENE = preload("res://particles/fireball.tscn")
const FIREBALL_SCENE2 = preload("res://particles/fireball2.tscn")

const SPEED = 165
onready var hand1 = get_node("hand1")
onready var hand2 = get_node("hand2")
var movetimer_length = 100 #total time to  which is used by movetimer variable.
var movetimer = 0 

	



func _ready():
	#connect("damage_taken",self,"damage_taken")
	#texture_default = $sprite.texture
	#texture_hurt = load("res://Boss/boss_hurt.png")
	movedir = bossDir.rand()
	speed = 40
	Global.Boss = self
	$anim.play("ready")
	var distance_to_player = self.position.distance_to(Global.Player.position)
	
		
	



	
func _physics_process(delta):
	movement_loop()
	move_randomly()
	move_to_player()
	if health <= 100:
		$anim.play("transform")
	if health <= 0:
		$anim.play("defeat")
		self.queue_free()
#	for area in $hitbox.get_overlapping_areas():
#
#
#
#		var body = area.get_parent()
#		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
#			if TYPE == "PLAYER":
#				take_dmg(body.get("DAMAGE"))
#
#			if TYPE == "BOSS" and hitstun > 0:
##				get_node("sprite").modulate = Color8(255,0,0)
#				health -= body.get("DAMAGE")
#				hitstun -=1
#				$sprite.texture = texture_hurt
#
#			else:
#				$sprite.texture = texture_default
##				get_node("sprite").modulate = Color8(0,0,0)	
#				hitstun = 10 
			
	
func movement_loop():
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * SPEED # if not overlapping body, normal movement in each direction
	else:
		motion = knockdir.normalized() * 125
	move_and_slide(motion, Vector2(0,0)) 

		
func move_randomly(): # this function makes alien move randomly changing directions but moving slowly.
	speed = 40
	
	if movetimer > 0:
		movetimer -=1
	if movetimer == 0 || is_on_wall(): # alien chaneges direction if its colliding with anything like a wall or object or till timer has reached 0.
		movedir = bossDir.rand()
		movetimer = movetimer_length	


	

func _on_Timer_timeout():
	
	
	
	if can_shoot == true:
		var fireball = FIREBALL_SCENE.instance()
		get_parent().add_child(fireball)
		fireball.global_position = hand1.global_position
		
		
	if can_shoot == true:
		var fireball2 = FIREBALL_SCENE2.instance()
		get_parent().add_child(fireball2)
		fireball2.global_position = hand2.global_position

func move_to_player():
	if self.position.x < Global.Player.position.x:
		movedir = dir.right
	elif self.position.x > Global.Player.position.x:
		movedir = dir.left
	elif self.position.x == Global.player.position.x:
		movedir = Vector2(0,0)

#func damage_loop():
#	if hitstun > 0:
#		hitstun -= 1
#		$sprite.texture = texture_hurt
#	else:
#		$sprite.texture = texture_default
#	for area in $hitbox.get_overlapping_areas():
#		var body = area.get_parent()
#		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
#			health -= 10
#			hitstun = 10
#			print(str(health))
			
func getHealth():
	return health
	
func die():
	queue_free()				
			

func take_damage(dmg):
	health-=dmg
		

	




