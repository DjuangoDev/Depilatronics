extends HBoxContainer

onready var hot_wax := $Buttons/hot_wax
onready var cold_wax := $Buttons/cold_wax
onready var tweezers := $Buttons/tweezers
onready var pull := $Buttons/pull

func _ready():
	hot_wax.but.pressed = true

func _on_hot_wax_pressed():
	disable_all()
	hot_wax.but.pressed = true

func _on_cold_wax_pressed():
	disable_all()
	cold_wax.but.pressed = true

func _on_tweezers_pressed():
	disable_all()
	tweezers.but.pressed = true

func _on_pull_pressed():
	disable_all()
	pull.but.pressed = true

func disable_all():
	hot_wax.but.pressed = false
	cold_wax.but.pressed = false
	tweezers.but.pressed = false
	pull.but.pressed = false
	
