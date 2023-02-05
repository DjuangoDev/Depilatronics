extends Node2D

# Level variables
var hair_number=0
var total_pain=0
var selected_tool = "FINGER"


func _ready():
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
		
	print(hair_number)

func _process(delta):
	# $HUD/ProgressBar.get_
	pass

# pulled hair Signals call this callback(): 
# extraction_perfection: 1-3
# hair_zone: 1-3
#	
func another_hair_bites_the_dust(extraction_tool, extraction_perfection, hair_zone):
	
	hair_number=hair_number-1
	if hair_number<0:
		$HUD/AnimationPlayer.play("victory")

func _on_hot_wax_pressed():
	selected_tool = "HOT_WAX"
	print(selected_tool)


func _on_tweezers_pressed():
	selected_tool = "TWEEEZERS"
	print(selected_tool)


func _on_pull_pressed():
	selected_tool = "PULL"
	print(selected_tool)
