extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Wax=preload("res://Assets/Prefabs/HotWax.tscn")
var current_wax=null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pinchar"):
		current_wax=Wax.instance()
		add_child(current_wax)
		current_wax.init_waxing(get_global_mouse_position())
	elif Input.is_action_just_released("pinchar"):
		current_wax.end_waxing(get_global_mouse_position())
