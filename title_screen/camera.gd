extends Camera2D

func _ready():
	set_process(true)
	
func _process(delta):
	var pos = get_camera_position()
	global_position.x += 1
	