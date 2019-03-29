extends CanvasLayer

#signal value_changed(maximum)

var BossHealthBar = 350
#var current_health = 350
#
#func initialize(maximum): 
#	BossHealthBar = maximum # level of max_health set to maximum level intialized in parameter
#	$TextureProgress.max_value = maximum # texture to show the current level for health bar
#	$TextureProgress.value	= 350
#	emit_signal("value_changed",current_health)

#func _on_Interface_health_changed(new_health):
#	$TextureProgress.value = new_health # texture for when the health level reduces
#	current_health = new_health

func _ready():
	set_physics_process(true)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		BossHealthBar -= 10

func _physics_process(delta):
	get_node("Control/ProgressBar").set_value(BossHealthBar)
	BossHealthBar += delta * 2


