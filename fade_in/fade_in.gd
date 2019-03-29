extends ColorRect
# Script to control fade in transition to new scene

signal fade_finished # signal emitted for when fade has been completed

func fade_in():
	$AnimationPlayer.play("fade_in") # fade in animation played

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_finished") # once transition has been completed, signal emitted for fade_finished

