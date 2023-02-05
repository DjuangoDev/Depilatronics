extends MarginContainer

onready var but : TextureButton = $TextureButton
onready var player : AnimationPlayer = $player
var pressed : bool = false


func _on_TextureButton_pressed():
	if but.pressed == true:
		but.pressed = true
		player.play("pressed")
		
func play_idle():
	player.play("idle")
