extends TextureButton


export(String, FILE, "*.tscn") var scene_to_load





func _on_NewGameBut_pressed():
	Global.TitleScreen.newGamePressed()

