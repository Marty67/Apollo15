extends Area2D

const FIREBALL_SPEED = 200


func _physics_process(delta):
	var speed_x = 1
	var speed_y = 0

	var motion = Vector2(speed_x, speed_y) * FIREBALL_SPEED
	position = position * motion

