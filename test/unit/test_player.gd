extends "res://addons/gut/test.gd"
"""
GUT unit test for player node

NOTE: All test scripts must begin with "test_"

Documentation: https://github.com/bitwes/Gut/wiki
"""
var Player = preload("res://Scripts/Player/player.gd")

func before_each():
	gut.p("ran setup", 2)

func after_each():
	gut.p("ran teardown", 2)

func before_all():
	gut.p("ran run setup", 2)

func after_all():
	gut.p("ran run teardown", 2)

func test_assert_idle():
	var player = Player.new()
	assert_true(player.idle, "Should pass.")

func test_assert_torch_on():
	var player = Player.new()
	assert_false(player.torch_on, "Should pass.")

func test_assert_equipped():
	var player = Player.new()
	assert_false(player.equipped, "Should pass.")