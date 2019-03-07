extends Control
# Script for the interface which controls health and oxygen levels

signal health_changed(health) # Signal for when the health changes
signal oxygen_changed(oxygen) # Signal for when the oxygen level changes

func _ready():
	var health_node = null 
	var oxygen_node = null
	for node in get_tree().get_nodes_in_group("actors"):
		if node.name =="Interface":
			health_node = node.get_node("Health") # health_node changed for null to health node
			$Bars/LifeBar.initialize(health_node.max_health) # Sets health bar to show current health level
			oxygen_node = node.get_node("Oxygen") # oxygen_node changed for null to oxygen node
			$Bars/OxygenBar.initialize(oxygen_node.max_oxygen) # Sets oxygen bar to current oxygen level
			break
			
func _on_Health_health_changed(health):
	emit_signal("health_changed", health) # when health is changed, health_changed signal is shown

func _on_Oxygen_oxygen_changed(oxygen):
	emit_signal("oxygen_changed", oxygen) # when oxygen level is changed, oxygen_changed signal is shown
	
	

	
	

	