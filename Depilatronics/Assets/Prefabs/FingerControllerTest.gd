extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var band=null
var Band=preload("res://Assets/Prefabs/HotWaxBand.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var mouse_position=get_global_mouse_position()
	if band==null:
		if Input.is_action_just_pressed("pinchar"):
			band=Band.instance()
			add_child(band)
			
			band.init_spreading(mouse_position)

	elif band.bandState==band.BandState.SPREADING:
		if Input.is_action_just_released("pinchar"):
			band.stop_spreading(mouse_position)
			
