extends Node2D

onready var tweezers := $tweezers
onready var tween := $Tween
onready var tweezers_end := $AnimatedSprite/tweezers_end
onready var sprite := $AnimatedSprite


const idle_position := Vector2(1200,655)

func _ready():
	#global_position = Vector2(1229,744)
	global_position = Vector2(1200,655)

func close():
	tweezers.play("tweezers_closed")

func open():
	tweezers.play("tweezers")


func pull_hair(hair):
	hair.i_have_pulled_you("TWEEZERS",1)

func rotate(degree):
	pass

func use_tweezers(position):
	if not tweezers.is_playing() and not tween.is_active():
		move_to(position)
		yield($Tween, "tween_completed")
		tweezers.play("tweezers_closed")

func disappear():
	tweezers.play("disappear")

func appear():
	tweezers.play("appear")

	
func move_to(pos):
	tween.interpolate_property(self, "global_position",
		self.global_position, pos, 0.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

#func _on_Tween_tween_all_completed():
#	tweezers.play("tweezers_closed")


func _on_Area2D_body_entered(body):
	if not body is Hair:
		tween.interpolate_property(self, "global_position",
		self.global_position, idle_position, 0.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()


func _on_tweezers_animation_finished(anim_name):
	print("animacion")
	if anim_name == "tweezers_closed":
		print("End tweezers closed")
		var areas = tweezers_end.get_overlapping_areas()
		for area in areas:
			if area is Hair:
				pull_hair(area)
			else:
				#TODO pinchazo en culete
				pass
		tweezers.play("tweezers")
		move_to(idle_position)


#func _on_tweezers_end_area_entered(area):
#	if area is Hair:
#		print("pelo")
#		pull_hair(area)
#		tween.interpolate_property(self, "global_position",
#		self.global_position, idle_position, 0.5,
#		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		tween.start()
#	else:
#		print("carne")
#		tween.interpolate_property(self, "global_position",
#		self.global_position, idle_position, 0.5,
#		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		tween.start()
