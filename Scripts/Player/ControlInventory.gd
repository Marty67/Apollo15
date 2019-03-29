extends Control

var inventory_state = false

func _input(event):
	if event.is_action_pressed("i") and inventory_state == false:
		#get_tree().paused = true
		inventory_state = true
		self.show()
	elif event.is_action_pressed("i") and inventory_state == true:
		#get_tree().paused = false
		inventory_state = false
		self.hide()
		
func save():
	var save_data = {self.get_name():Global.Inventory.save_inv()}
	return save_data

func load_state(data):
	Global.Inventory.load_inv(data)		
		
		
		
			
	
			
