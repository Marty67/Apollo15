extends node

signal health_changed(new_health)

var health = 0
export(int) var max_health = 350

func _ready():
	Global.Health = self
	health =  max_health
	emit_signal("health_changed", health)
	
func set_maximum(value):
	max_health = max(0,value)
	
func take_damage(amount):
	health -=amount
	health = max(0,health)
	emit_signal("health_changed", health)	
	
func sethealth(new_health):
	health = new_health	

func getHealth():
	return health
