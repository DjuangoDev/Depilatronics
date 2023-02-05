extends Node2D

# Level variables
var hair_number=0
var total_pain=0
var selected_tool = "FINGER"
onready var tweezers := $tweezers
onready var pain_zone := $PainZones
onready var hud := $HUD

var pain_reduction = 1
var pain_hair_base = 3
var minimum_pain = 35

func _ready():
	total_pain = minimum_pain
	for hair in $Culo1/Hairy.get_children():
		hair_number=hair_number+1
		hair.connect("hair_pulled",self,"another_hair_bites_the_dust")
		
		var zones=hair.get_overlapping_areas()
		for zone in zones:
			if zone.is_in_group("UnmanegeablePain"):
				hair.pain=3
			elif zone.is_in_group("HighPain"):
				hair.pain=2
			elif zone.is_in_group("MediumPain"):
				hair.pain=1
	pain_zone.queue_free()

#func _process(delta):
	# $HUD/ProgressBar.get_
func _unhandled_input(event):
   if event is InputEventMouseButton and selected_tool == "TWEEEZERS":
	   tweezers.use_tweezers(event.get_position())
	
func another_hair_bites_the_dust(extraction_tool, extraction_perfection, hair_zone):
	if extraction_tool == "TWEEZERS":
		total_pain += pain_hair_base * extraction_perfection * hair_zone
		hud.set_pain(total_pain)
		print(total_pain)
	hair_number=hair_number-1
	if hair_number<=0:
		$HUD/AnimationPlayer.play("victory")

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


func _on_decrease_pain_timeout():
	total_pain -= pain_reduction
	if total_pain < minimum_pain:
		total_pain = minimum_pain
	hud.set_pain(total_pain)
	print("Segundos")
	print(total_pain)
