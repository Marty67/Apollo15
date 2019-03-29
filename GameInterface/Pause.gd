extends Control
# script for in game pause menu


func _ready():
	Global.Pause = self

func _input(event):
	if event.is_action_pressed("pause"): # event for when pause button is pressed in game
		var buttonPlayer = AudioStreamPlayer.new()
		self.add_child(buttonPlayer)
		buttonPlayer.stream  = load("res://soundscrate-switch-click-1.wav") # load sound being played while in pause menu
		buttonPlayer.play() # play sound which has been loaded
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state # pause state for when game is paused 
	

func _on_resumeBtn_pressed(): # when resume button is pressed on pause menu
	var buttonPlayer = AudioStreamPlayer.new()
	self.add_child(buttonPlayer)
	buttonPlayer.stream  = load("res://soundscrate-switch-click-1.wav") # sound loaded 
	buttonPlayer.play() # play audio which has been loaded
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state


func _on_menuBtn_pressed(): # when menu button has been pressed from pause menu
	var buttonPlayer = AudioStreamPlayer.new()
	self.add_child(buttonPlayer)
	buttonPlayer.stream  = load("res://soundscrate-switch-click-1.wav") # load audio
	buttonPlayer.play() # play audio which has been loaded
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	get_tree().change_scene("res://title_screen/Title Screen.tscn") # scene changed to the main menu screen
	


func _on_saveBtn_pressed(): # when save button has been pressed from pause menu
    var save_game = File.new() # save current state into new file
    save_game.open("user://savegame.save", File.WRITE) # enter save details into save file
    var save_nodes = get_tree().get_nodes_in_group("Persistant")
    for i in save_nodes:
        var node_data = i.call("save");
        save_game.store_line(to_json(node_data)) # contains details of nodes to be saved to the file
    save_game.close()
    print ("saved")

func _on_loadBtn_pressed():
	loadGame()
	                             # when load button is pressed from pause menu
	
func loadGame():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.READ) # read the contents of the save file
	var save_nodes = get_tree().get_nodes_in_group("Persistant")
	var data = {}
	while not save_game.eof_reached():
		data = parse_json(save_game.get_line())
		if data != null:
			for k in data.keys():
				for n in save_nodes:
					if k == n.get_name():
						n.load_state(data[k]) # load the content of the save file to the current game
	print("loaded")
		






func _on_pauseBtn_pressed(): # event for when pause button has been pressed again
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state

