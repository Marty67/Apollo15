extends TextureButton


export(String, FILE, "*.tscn") var scene_to_load



func _on_TutorialButton_pressed():
	get_tree().change_scene("res://Scenes/Tutorial_Loader.tscn")

