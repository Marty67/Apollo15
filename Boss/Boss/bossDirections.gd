extends Node
# Script for direction which enemies and player can move

const center = Vector2(0,0) 
const left = Vector2(-1,0)
const right = Vector2(1,0)
#const up = Vector2(0,-1)
#const down = Vector2(0,1) # all four directions for which entity can move including idle when center direction

func rand():
#	var d = randi() % 4 + 1 # method to randomly pick direction from four possible directions
	var d = randi() % 2 + 1
	match d:
		1:
			return left 
		2:
			return right
#		3:
#			return up
#		4:
#			return down # from random method, if value matches value for d, direction will be played