extends HBoxContainer

onready var progress := $ProgressBar
onready var hot_wax := $Buttons/hot_wax
onready var tweezers := $Buttons/tweezers
onready var pull := $Buttons/pull

func _ready():
	hot_wax.but.pressed = true

func _input(event):
	if event.is_action_pressed("ui_right"):
		progress.add_pain(10)
	if event.is_action_pressed("ui_left"):
		progress.add_pain(-10)
	

func _on_hot_wax_pressed():
	disable_all()
	hot_wax.but.pressed = true

func _on_tweezers_pressed():
	disable_all()
	tweezers.but.pressed = true

func _on_pull_pressed():
	disable_all()
	pull.but.pressed = true

func disable_all():
	hot_wax.but.pressed = false
	tweezers.but.pressed = false
	pull.TextureButton.pressed = false
	
