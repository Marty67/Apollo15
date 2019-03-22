extends Control
# Script for main menu 

var scene_path_to_load

func _ready():
	$Canvas_Menu/Menu/CenterRow/MainButtons/NewGameBut.grab_focus()
	for button in $Canvas_Menu/Menu/CenterRow/MainButtons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load]) # when button is pressed, the main menu scene is loaded
		
func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load # when button is pressed, load the appropriate scene
	$FadeIn.show()
	$FadeIn.fade_in() # fade in affect used to transition to new scene
	var musicPlayer = AudioStreamPlayer.new()
	self.add_child(musicPlayer)
	musicPlayer.stream  = load("res://soundscrate-switch-click-1.wav") # audio to be played while on the title screen
	musicPlayer.play()
	
func _on_TransitionFX_fade_finished():
	get_tree().change_scene(scene_path_to_load)



	