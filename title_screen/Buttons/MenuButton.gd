extends TextureButton


export(String, FILE, "*.tscn") var scene_to_load
#var timer


	
	

func _on_ContinueBut_pressed():
	get_tree().change_scene("res://MainGame.tscn")
	
	
func _on_Timer_timeout():
	
	#Global.Pause.loadGame()
	print("load")
	
