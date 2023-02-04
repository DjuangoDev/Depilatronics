extends Node2D

onready var tweezers := $tweezers
onready var tween := $Tween
onready var tweezers_end := $tweezers_end

var over_hair = false

const exit_position := Vector2(1500,300)

func _ready():
	tweezers.play("tweezers")

func close():
	tweezers.play("tweezers_closed")

func open():
	tweezers.play("tweezers")


func pull_hair():
	move_to(exit_position)

func move_to(pos):
	if not tweezers.is_playing() and not tween.is_active():
		tween.interpolate_property(self, "global_position",
			self.global_position, pos, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func _on_Tween_tween_all_completed():
	tweezers.play("tweezers_closed")


func _on_Area2D_body_entered(body):
	if not body is Hair:
		tween.interpolate_property(self, "global_position",
		self.global_position, exit_position, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()


func _on_tweezers_animation_finished(anim_name):
	if anim_name == "tweezers_closed":
		var areas = tweezers_end.get_overlapping_areas()
		for area in areas:
			if area is Hair:
				over_hair = true
				return
		tweezers.play("tweezers")
		move_to(exit_position)
