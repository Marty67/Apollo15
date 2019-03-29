extends Node2D

func _ready():
	$anim.play("default")
	$anim.connect("animation_finished",self,"destroy") # when health is 0, animation_finished should play before disappearing
	
func destroy(animation):
	queue_free() # when the health of node reaches 0, death animation should play and node should be removed from queue