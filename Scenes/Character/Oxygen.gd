extends Node
# Script for controlling the oxygen level

signal oxygen_changed(new_oxygen) # signal emitted for when oxygen level changes
#signal damage_taken(new_health)

var oxygen = 0
export(int) var max_oxygen = 100 # maximum oxygen level set to 100

func _ready():
	Global.Oxygen = self
	oxygen =  max_oxygen
	emit_signal("oxygen_changed", oxygen) # oxygen has been changed to emit oxygen_changed signal
	
#func set_maximum(value):
	#max_oxygen = max(0,value)
	
func lose_oxygen(amount): # gradually decrement oxygen level
	oxygen -=amount # decrement oxygen level by ammount initialized 
	oxygen = max(0,oxygen)
	emit_signal("oxygen_changed", oxygen) # oxygen has been changed to emit oxygen_changed signal
	#emit_signal("oxygen_lost",oxygen)
	
		
func gain_oxygen(amount): # oxygen is incremented by amount in parameter
	if oxygen + amount > 100:
		oxygen = 100 # is new oxygen level will be less than 100, set level to 100
	else:
		oxygen+=amount # else increment the oxygen level by the amount set
			
	
	
	#oxygen = max(oxygen, max_oxygen)
	emit_signal("oxygen_changed", oxygen)
	
func load_oxygen(o2):
	oxygen = o2
	emit_signal("oxygen_changed", oxygen) 

func getOxygen():
	return oxygen						