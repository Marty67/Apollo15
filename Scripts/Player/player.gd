extends "res://Scripts/Engine/Entity.gd"


 
const DAMAGE = 2   #  this controls how much damage the player does to enemy.
const TYPE = "PLAYER" #this is used to identify player instance so enemy does damage to player
const LAZER = preload("res://particles/lazer.tscn")
var idle = true 
var torch_on = false
var equipped = false

var components = 0 # keeps track of the total components the player has.

func _ready():
	Global.Player = self  # this allows the player script to be accessed in any script.
	speed = 200 

func _physics_process(delta):  # this method is a special method which is like a loop everything inside this method is being executed all the time.
	
	controls_loop() 
	movement_loop()
	damage_loop()
	spritedir_loop()
	
	
	if movedir != Vector2(0,0):
		idle = false;
		anim_switch("walk")
	elif idle == false:
		idle = true
		anim_switch("idle") #activates idle animation 
	if Input.is_action_just_pressed("a") and idle == true:  #only allows player to attack with weapon if still and not using gun.
		anim_switch("attack")
	
	if Input.is_action_just_pressed("a"):
		use_item(preload("res://sword.tscn"))
		anim_switch("attack")
		var hitPlayer = AudioStreamPlayer.new()
		self.add_child(hitPlayer)
		hitPlayer.stream  = load("res://soundscrate-lightsword-fast-swing-1.wav") # loads the attack sound
		hitPlayer.play() # plays the attack sound.
		
	if Input.is_action_just_pressed("y"): # for testing purposes to give oxygen to player.
		gain_o2(50)
		
	if Input.is_action_just_pressed("t"): # allows player to toggle torchlight on and off with "t" button 
	
		if torch_on == false:   # boolean variable is used to check if torch is on or off.
			torch_on = true
			$torch.show() # this shows the torch light 2d node on screen to enable torch light.
		else:
			torch_on = false
			$torch.hide() # this hides the torch light node to show the torch turning off on screen.
			
	if Input.is_action_just_pressed("d"):
		if equipped:
			$gun.hide()
			equipped = false
			
		else:	
			$gun.show()
			equipped = true
			
			
	if Input.is_action_just_pressed("f")  and equipped == true:
		
		var lazer_shot = LAZER.instance()
		get_parent().add_child(lazer_shot)
		lazer_shot.global_position = $gun/Position2D.global_position
		
		if movedir == dir.right:
			Global.Lazer.set_position(10,0)
			Global.Lazer.rotation_degrees = 90
			
		elif movedir == dir.left:
			Global.Lazer.set_position(-10,0)
			Global.Lazer.rotation_degrees = -90
			
		elif movedir == dir.down:
			Global.Lazer.set_position(0,10)
			#Global.Lazer.rotation_degrees =  -180
			
		elif movedir == dir.up:
	   		Global.Lazer.set_position(0,-10)
	   		#Global.Lazer.rotation_degrees = 90
			
		else:
			
			if $anim.current_animation ==  "idledown":
				Global.Lazer.set_position(0,10)
				
			elif $anim.current_animation ==  "idleup":
				Global.Lazer.set_position(0,-10)
				
			elif $anim.current_animation ==  "idleleft":
				Global.Lazer.set_position(-10,0)
				Global.Lazer.rotation_degrees = -90
				
			elif $anim.current_animation ==  "idleright":
				Global.Lazer.set_position(10,0)
				Global.Lazer.rotation_degrees = 90		
				
			
				
					
			
			 						
			
			
			
			
			
					

					
				

func take_damage(damage):
	damage_sound() #this plays the sound of player taking damage. 
	Global.Health.take_damage(damage) #this calls the take damage method in the health node. 
	
func lose_oxygen(atm):
	Global.Oxygen.lose_oxygen(atm) # this calls the lose oxygen method on the oxygen node.
	
func heal_lp(life):
	_foodpickupSFX() #this plays a sound  effect for gaining life with food.
	Global.Health.heal(life)
	
func gain_o2(gain):
	_pickupSFX() #this plays sound effect for gaining oxygen with a oxygen tank.
	Global.Oxygen.gain_oxygen(gain)	#this calls the gain_oxygen method in the oxygen node. 
	
func lose_o2():
	lose_oxygen(2) # this calls lose_oxygen and passes 2 so player loses 2 percent oxygen each time it is called.
	
func burn():
	$Fire.show()
	get_node("sprite").modulate = Color8(100.61,38.86,34.19)

	
	
func normal():
	$Fire.hide()
	get_node("sprite").modulate = Color8(255,255,255)
	
			
	
func add_component():
	_pickupSFX() #plays a sound effect for picking up a component.
	components+=1	# this increments the componnet variable, this is called when player picks up a component.
	
	
func controls_loop():  
	
	if 	Input.is_action_pressed("ui_left"):  # this changes direction to left when player uses left arrow key.
		$torch/AnimationPlayer.play("rotateLeft") # this rotates torch to left when player is facing left direction.
		
	elif Input.is_action_pressed("ui_right"): # this changes direction to right when player uses right arrow key.
		$torch/AnimationPlayer.play("rotateRight") # this rotates torch to right when player is facing right direction.
		
	elif Input.is_action_pressed("ui_up"): # this changes direction to up when player uses up arrow key.
		$torch/AnimationPlayer.play("rotateUp") # this rotates torch to up when player is facing up direction.
		
	elif Input.is_action_pressed("ui_down"): # this changes direction to down when player uses down arrow key.
		$torch/AnimationPlayer.play("rotateDown")	 # this rotates torch to down direction when player is facing down direction.			
		
	
#	var LEFT	= Input.is_action_pressed("ui_left")
#	var RIGHT	= Input.is_action_pressed("ui_right")
#	var UP	    = Input.is_action_pressed("ui_up")
#	var DOWN	= Input.is_action_pressed("ui_down")
	
	var x = 0
	var y = 0
	if movedir.y == 0:
		movedir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if movedir.x == 0:
		movedir.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

func _on_Timer_timeout(): # this method is called every 2 seconds and calls lose_o2() method so player loses oxygen dynamically.
	lose_o2()
	

func save():
	var save_dict = {self.get_name():{
		"pos_x":self.position.x,
		"pos_y":self.position.y}
	}
	return save_dict


func load_state(data):
	position.x = data["pos_x"]
	position.y = data["pos_y"]
	
	#for attribute in data:
	#	if attribute == 'pos':
	#		set_pos(Vector2(data['pos']['x'], data['pos']['y']))	
		

func _pickupSFX(): # this sets up the pickup sound effect. 
	var pickupPlayer = AudioStreamPlayer.new()
	self.add_child(pickupPlayer)
	pickupPlayer.stream  = load("res://SoundsCrate-SciFi-Laser2.wav")
	pickupPlayer.play()

func _foodpickupSFX(): # this sets up the foodpickup sound effect.
	var pickupPlayer = AudioStreamPlayer.new()
	self.add_child(pickupPlayer)
	pickupPlayer.stream  = load("res://Map/World1/WorldMaps/soundscrate-old-camera-sounds-1.wav")
	pickupPlayer.play()
	
	
	
	
	
	
