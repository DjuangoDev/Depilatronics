extends HBoxContainer

onready var progress := $ProgressBar
onready var hot_wax := $Buttons/hot_wax
onready var tweezers := $Buttons/tweezers
onready var pull := $Buttons/pull
onready var timer := $Timer
onready var timer_label : Label = $Buttons/timer/time

var total_time = 120

func _ready():
	hot_wax.but.pressed = true

func _process(delta):
	if not int(timer.time_left) == int(timer_label.text):
		timer_label.text = str(int(timer.time_left))

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
	
