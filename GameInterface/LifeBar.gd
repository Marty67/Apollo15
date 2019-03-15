extends HBoxContainer
# script for health bar

signal maximum_changed(maximum) # signal for when the max amount of health lost has been reached

var max_health = 100 # max health player has
var current_health = 100 # current health level of the player


	
func initialize(maximum): 
	max_health = maximum # level of max_health set to maximum level intialized in parameter
	$TextureProgress.max_value = maximum # texture to show the current level for health bar
	$TextureProgress.value	= 100
	emit_signal("maximum_changed",max_health) # when health is changed signal is emitted
	
		
func _on_Interface_health_changed(new_health):
	$TextureProgress.value = new_health # texture for when the health level reduces
	current_health = new_health # texture for life bar at max replaced by new one


func save():
	var save_dict = {self.get_name():{ 
		"health_bar":self.current_health,}
	} # save a dictionary structure showing the current health level to save
	return save_dict


func load_state(data):
	current_health = data["health_bar"] # load the current health based on the level saved previously

	
	
	






