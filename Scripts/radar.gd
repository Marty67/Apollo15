extends Area2D

var entered = false

func _ready():
	connect("body_entered",self,"body_entered")
	connect("body_exited",self,"body_exited")
	

func body_entered(body):
	
	if body.name == "player":
		$Label.show()
		entered = true
		
func body_exited(body):
	if body.name == "player":
		$Label.hide()
		entered = false		
		
func _physics_process(delta):
	if Input.is_action_just_pressed("e") and entered == true:
		Global.Inventory.addItem("radar")
		queue_free()



