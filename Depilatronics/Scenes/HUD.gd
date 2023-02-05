extends HBoxContainer

onready var progress := $ProgressBar
onready var hot_wax := $Buttons/hot_wax
onready var tweezers := $Buttons/tweezers
onready var pull := $Buttons/pull

var total_time = 120

func _ready():
	hot_wax.but.pressed = true

func _input(event):
	if event.is_action_pressed("ui_right"):
		progress.add_pain(10)
	if event.is_action_pressed("ui_left"):
		progress.add_pain(-10)

func set_pain(value):
	progress.set_pain(value)

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
	hot_wax.play_idle()
	tweezers.but.pressed = false
	tweezers.play_idle()
	pull.but.pressed = false
	pull.play_idle()
	
