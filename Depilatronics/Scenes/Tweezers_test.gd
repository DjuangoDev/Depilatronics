extends Node2D

onready var tweezers = $tweezers

func _ready():
	tweezers.visible = false


func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			var touchPoint = event.get_position()
			tweezers.visible = true
			tweezers.position = touchPoint
		else:
			tweezers.visible = false
			tweezers.position = Vector2(-100, -100)
