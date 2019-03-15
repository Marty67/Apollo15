extends HBoxContainer
# script for the oxygen bar 

signal maximum_changed(maximum) # signal for when the max amount of oxygen lost has been reached

var max_oxygen = 100 # max oxygen player has
var current_oxygen = 0 # # current oxygen level of the player



	
func initialize(maximum):
	max_oxygen = maximum # level of max_oxygen set to maximum level intialized in parameter
	$TextureProgress.max_value = maximum # texture to show the current level for oxygen bar
	$TextureProgress.value	= 100
	emit_signal("maximum_changed",max_oxygen) # when hoxygen level is changed signal is emitted
		
func _on_Interface_oxygen_changed(new_oxygen):
	$TextureProgress.value = new_oxygen # texture for when the oxygen level reduces
	current_oxygen = new_oxygen # texture for oxygen bar at max replaced by new one
	


func save():
	var save_dict = {self.get_name():{
		"oxygen_bar":current_oxygen}
	} # save a dictionary structure showing the current oxygen level to save
	return save_dict


func load_state(data):
	current_oxygen = data["oxygen_bar"] # load the current health based on the level saved previously
