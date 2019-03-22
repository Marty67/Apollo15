extends TextureButton

export(String, FILE, "*.tscn") var scene_to_load 

func _on_Quit_pressed():
	button_sfx()
	get_tree().quit()

func button_sfx(): # sound played for when button is pressed in main menu
	var musicPlayer = AudioStreamPlayer.new()
	self.add_child(musicPlayer)
	musicPlayer.stream  = load("res://soundscrate-switch-click-1.wav")

