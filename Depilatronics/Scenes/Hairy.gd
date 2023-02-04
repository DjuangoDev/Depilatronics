extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for hair in get_children():
		hair.connect("tip_touched",self,"hair_tip_touched")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hair_tip_touched(object):
	object.see_to(object.position)

func _on_Hair2_mouse_entered():
	pass	
