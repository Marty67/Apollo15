extends Node2D

func _ready():
	Global.Ending = self

func play():
	Global.Maploader.hide_ui()
	Global.Player.die()
	#Global.Boss.die()
	$ending.show()
	$ending.play()
	
