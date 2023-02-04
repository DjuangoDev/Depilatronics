extends Node2D

onready var tweezers := $tweezers

func _ready():
	tweezers.play("tweezers")

func close():
	tweezers.play("tweezers_closed")

func open():
	tweezers.play("tweezers")
