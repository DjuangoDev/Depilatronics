extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_inicio_button_pressed():
	get_tree().change_scene("res://Scenes/Depilating.tscn")


func _on_creditos_button_pressed():
	get_tree().change_scene("res://Scenes/credits.tscn")


func _on_salir_button_pressed():
	get_tree().quit()
