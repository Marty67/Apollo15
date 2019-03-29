extends Control
# Script for main menu 

var scene_path_to_load
var timer

func _ready():
	$Canvas_Menu/Menu/CenterRow/MainButtons/NewGameBut.grab_focus()
	for button in $Canvas_Menu/Menu/CenterRow/MainButtons.get_children():
		if button.name != "NewGameBut" and  button.name !="ContinueBut":
			button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load]) # when button is pressed, the main menu scene is loaded
	Global.TitleScreen = self	
		
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
	
	
func loadScene():
	$intro.stop()
	$intro.hide()
	timer.stop()
	get_tree().change_scene("res://Scenes/MainGame.tscn")



	

func newGamePressed():
	$parallax_background/Zuice.hide()
	$parallax_background/Picydon.hide()
	$parallax_background/Haydies.hide()
	$Canvas_Menu/Title_Overlay.hide()
	$parallax_background/backgroundLayer.hide()
	$Canvas_Menu/Sprite.hide()
	$Canvas_Menu/Overlay2.hide()
	$Canvas_Menu/Menu/CenterRow/MainButtons/SettingsBut.hide()
	$Canvas_Menu/Menu/CenterRow/MainButtons/Quit.hide()
	$Canvas_Menu/Menu/CenterRow/MainButtons/NewGameBut.hide()
	$Canvas_Menu/Menu/CenterRow/MainButtons/ContinueBut.hide()
	$Canvas_Menu/Menu/CenterRow/MainButtons.hide()
	$Canvas_Menu/Menu/CenterRow.hide()
	$Canvas_Menu/Menu.hide()
	Global.MenuCamera.stopMoving()
	
	$intro.show()
	$intro.play()
	timer = Timer.new()
	timer.set_wait_time(91)
	timer.connect("timeout",self,"loadScene")
	add_child(timer)
	timer.start()
	

