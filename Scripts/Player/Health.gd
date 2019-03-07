extends Node

signal health_changed(new_health)
#signal damage_taken(new_health)

var health = 0
export(int) var max_health = 100 

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
	
		
func heal(amount):
	if health + amount > 100:
		health = 100
	else:
		health+=amount	
	
	emit_signal("health_changed", health)
	
func getHealth():
	return health
	
func save():
	var save_dict = {self.get_name():{
		"saved_health":self.health,
		}
	}
	return save_dict


func load_state(data):
	health  = data["saved_health"]

	
						