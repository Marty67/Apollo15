extends "res://addons/gut/test.gd"
"""
GUT unit test for player health node

NOTE: All test scripts must begin with "test_"

Documentation: https://github.com/bitwes/Gut/wiki
"""
var Health = preload("res://Scripts/Player/Health.gd")

func before_each():
	gut.p("ran setup", 2)

func after_each():
	gut.p("ran teardown", 2)

func before_all():
	gut.p("ran run setup", 2)

func after_all():
	gut.p("ran run teardown", 2)

func test_assert_health_initialised_to_max():
	var health = Health.new()
	health._ready()
	assert_eq(health.getHealth(),health.max_health, "Should pass.")

func test_assert_max_health_can_be_changed():
	var health = Health.new()
	health.set_maximum(200)
	assert_eq(200,health.max_health, "Should pass.")

func test_assert_damage():
	var health = Health.new()
	health._ready()
	var hp = health.getHealth()
	health.take_damage(17)
	assert_eq((hp - 17),health.getHealth(), "Should pass.")