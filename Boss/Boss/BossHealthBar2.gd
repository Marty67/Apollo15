extends CanvasLayer

signal value_changed(maximum) 

var BossHealthBar = 350


func _ready():
	set_physics_process(true)

#func _input(event):
#	if event.is_action_pressed("ui_accept"):
#		BossHealthBar -= 10

func _physics_process(delta):
	get_node("Control/ProgressBar").set_value(BossHealthBar)
	BossHealthBar += delta * 2


