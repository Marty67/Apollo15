extends TextureButton
# Script for buttons 

export(String, FILE, "*.tscn") var scene_to_load # scene to be loaded when initially

func _ready():
	var endPlayer = AudioStreamPlayer.new()
	self.add_child(endPlayer)
	endPlayer.stream  = load("res://Sound_Effect_-_Mission_failed_we_ll_get_em_next_time-9RAbYECBpVA.wav") # load the audio to be played while scene played
	endPlayer.play()	# play the audio which has been loaded

func _on_TextureButton_pressed():
	button_sfx()
	get_tree().change_scene(scene_to_load) # when button has been pressed, change the scene being played
	

func _on_TextureButton2_pressed():
	button_sfx()
	get_tree().quit() # when quit button has been pressed, close the scene
	
func button_sfx(): # sound played for when button is pressed in main menu
	var musicPlayer = AudioStreamPlayer.new()
	self.add_child(musicPlayer)
	musicPlayer.stream  = load("res://soundscrate-switch-click-1.wav")