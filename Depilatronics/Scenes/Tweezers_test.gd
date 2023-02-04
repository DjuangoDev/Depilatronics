extends Node2D

onready var tweezers = $tweezers


func _unhandled_input(event):
	if event is InputEvent:
		if event.is_pressed():
			if tweezers.over_hair:
				tweezers.pull_hair()
			else:
				var touchPoint = event.get_position()
				tweezers.move_to(touchPoint)
				print(touchPoint)
