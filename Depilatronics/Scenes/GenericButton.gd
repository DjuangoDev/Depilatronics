extends MarginContainer

onready var but : TextureButton = $TextureButton
var pressed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_TextureButton_pressed():
	if but.pressed == true:
		but.pressed = true
