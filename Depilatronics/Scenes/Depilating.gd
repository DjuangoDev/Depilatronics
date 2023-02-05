extends Node2D

# Level variables
var hair_number=0
var total_pain=0
var selected_tool = "FINGER"
onready var tweezers := $tweezers
onready var pain_zone := $PainZones
onready var hud := $HUD
onready var no := $no

var pain_reduction = 1
var pain_hair_base = 3
var pain_ass_pinch = 15
var minimum_pain = 35
var maximum_pain = 100
var maximum_inflicted_pain = 40

func _ready():
	total_pain = minimum_pain
	for hair in $Culo1/Hairy.get_children():
		hair_number += 1
		hair.connect("hair_pulled",self,"another_hair_bites_the_dust")
		var zones=hair.get_overlapping_areas()
		for zone in zones:
			if zone.is_in_group("unmanageable_pain"):
				hair.pain=3
			elif zone.is_in_group("high_pain"):
				hair.pain=2
			elif zone.is_in_group("medium_pain"):
				hair.pain=1
	pain_zone.queue_free()

#func _process(delta):
	# $HUD/ProgressBar.get_
func _unhandled_input(event):
   if event is InputEventMouseButton and selected_tool == "TWEEEZERS":
	   tweezers.use_tweezers(event.get_position())
	
func another_hair_bites_the_dust(extraction_tool, extraction_perfection, hair_zone):
	if extraction_tool == "TWEEZERS":
		no.play(0.32)
		add_total_pain(pain_hair_base * extraction_perfection * hair_zone)
	hair_number=hair_number-1
	if hair_number<=0:
		finished("VICTORY")

func add_total_pain(pain):
	total_pain += pain
	if total_pain < minimum_pain:
		total_pain = minimum_pain
	elif total_pain >= maximum_pain:
		total_pain = maximum_pain
		maximum_inflicted_pain = total_pain
		finished("PASSED_OUT")
	if total_pain > maximum_inflicted_pain:
		maximum_inflicted_pain = total_pain
	hud.set_pain(total_pain)
	

func _on_hot_wax_pressed():
	if selected_tool == "TWEEEZERS":
		tweezers.disappear()
	selected_tool = "HOT_WAX"


func _on_tweezers_pressed():
	selected_tool = "TWEEEZERS"
	tweezers.appear()


func _on_pull_pressed():
	if selected_tool == "TWEEEZERS":
		tweezers.disappear()
	selected_tool = "PULL"


func _on_tweezers_in_skin_pinch(pain_):
	squinch(pain_)
	add_total_pain(pain_ass_pinch)

func squinch(pain_):
	$CuloAnimator.play("squinch")


func _on_decrease_pain_timeout():
	add_total_pain(-pain_reduction)

func _on_Timer_timeout():
	finished("NO_TIME")

func finished(reason):
	if reason=="NO_TIME":
		$FinalNotice.visible=true
		$FinalNotice/TimeOut.visible=true
		$FinalNotice/TimeOut.set_stats(maximum_inflicted_pain,str($HUD/Timer.time_left),hair_number,1)
	elif reason=="VICTORY":
		$FinalNotice.visible=true
		$FinalNotice/Victory.visible=true
		$FinalNotice/Victory.set_stats(maximum_inflicted_pain,str($HUD/Timer.time_left),hair_number,1)
	elif reason=="PASSED_OUT":
		$FinalNotice.visible=true
		$FinalNotice/Passout.visible=true
		$FinalNotice/Passout.set_stats(maximum_inflicted_pain,str($HUD/Timer.time_left),hair_number,1)
	get_tree().paused = true
