extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func set_stats(pain,time,n_hairs,n_people):
	$Texto.text="What a Shame...! There are still "+str(n_hairs)+" hairs to eliminate...!!\nMaximum pain inflicted: "+str(pain)


func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Portada.tscn")
