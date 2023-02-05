extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_stats(pain,time,n_hairs,n_people):
	$Texto.text="What a Shame...! You only got "+str(n_hairs)+" hairs...!!\nMaximum pain inflicted:"+str(pain)


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Portada.tscn")
