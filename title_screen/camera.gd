extends Camera2D

var moving = true

func _ready():
	set_process(true)
	Global.MenuCamera = self
	
	
func _process(delta):
	
	if moving == true:
		var pos = get_camera_position()
		global_position.x += 1
		
func stopMoving():
	moving = false
			
		
		
	
	