extends Node2D

onready var tweezers = $tweezers


func _unhandled_input(event):
	if event is InputEvent:
		if event.is_pressed():
			tweezers.use_tweezers(event.get_position())
