extends Particles2D
# Script for adding the fog texture above the game scene

func start():
	emitting = true
	yield(get_tree().create_timer(lifetime * speed_scale * 1.2), "timeout")
	queue_free()
