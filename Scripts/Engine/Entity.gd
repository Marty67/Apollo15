extends KinematicBody2D
# this script can be seen a superclass to contain methods which are necessary for both the player and the enemy

const MAXHEALTH = 25 # health for both player any enemy set to 25
const TYPE = "ENEMY" # separate variable to differentiate between player and enemy type
var speed = 0 # speed initially set to 0

onready var tree = get_tree()


var movedir = Vector2(0,0)
var knockdir = Vector2(0,0)
var spritedir = "down"

var hitstun = 0 
var health = MAXHEALTH
var texture_default = null
var texture_hurt = null



func _ready():
	 
	texture_default = $sprite.texture  # display normal sprite and animation while walking and idle
	texture_hurt = load($sprite.texture.get_path().replace(".png","_hurt.png")) 


func movement_loop():
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * speed # if not overlapping body, normal movement in each direction
	else:
		motion = knockdir.normalized() * 125
	move_and_slide(motion, Vector2(0,0)) # if body does overlap, move in the opposite direction intially moving

func spritedir_loop(): # node moves in normal direction selected 
	match  movedir:
		Vector2(-1,0):
			spritedir = "left" 
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"

func anim_switch(animation): # animation changes based on whether player is moving or idle and different animation for each direction
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func damage_loop():
	var not_attacked = true

	var dropChance = randi() % 4 + 1 # only 1 in 4 chance of enemy dropping item
	
	if hitstun > 0: # if enemy or player is hit, the texture_hurt is replace with current texture
		hitstun -= 1	
		$sprite.texture = texture_hurt
		
	else: # if player is not hit, normal texture is displayed
		$sprite.texture = texture_default
	
		
		
		if TYPE  == "ENEMY" and health <=0: # if the type of the node is enemy and health has reached 0, death animation for enemy will play
			var  death_animation = preload("res://Scenes/Character/enemy_death.tscn").instance()
			var  baguette = preload("res://Items/baguette.tscn").instance() # possible item dropper will be the baguette node
			get_parent().add_child(death_animation)
			death_animation.global_transform = global_transform
			queue_free() # enermy node if removed from memory to make it disappear from the screen
			if dropChance == 3: # if random value is 3, the item baguette will be dropped
				get_parent().add_child(baguette)
				baguette.global_transform = global_transform
			
			
	if TYPE == "PLAYER": # if player health or oxygen level reaches 0, player node will be removed from the queue and disappear from the screen
		if Global.Health.getHealth() <=0 or Global.Oxygen.getOxygen() <= 0:
			queue_free()
			game_over()
			
	for area in $hitbox.get_overlapping_areas():
		  
		var body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE:
			if TYPE == "PLAYER":
				take_dmg(body.get("DAMAGE"))
			health -= body.get("DAMAGE")
			hitstun = 10 # if player is hit by enemy due to overlapping body, health should decrease and call the enemy to be knocked back 
			knockdir = global_transform.origin - body.global_transform.origin

func use_item(item): # allows player to use an item being either the baguette or the oxygen tank
	var newitem = item.instance()
	newitem.add_to_group(str(newitem.get_name(), self))
	add_child((newitem)) 
	if get_tree().get_nodes_in_group(str(newitem.get_name(), self)).size() > newitem.maxamount:
		newitem.queue_free()
		
func take_dmg(num):
	Global.Player.take_damage(num)
	
func game_over(): # use to show game over screen when conditions are met
	tree.change_scene("res://title_screen/GameOverScreen.tscn")		
			
func damage_sound():
	var damagePlayer = AudioStreamPlayer.new()
	self.add_child(damagePlayer)
	damagePlayer.stream  = load("res://soundscrate-arrow-hit-1.wav")
	damagePlayer.play()	
	
	