extends Node2D

# Level variables
var hair_number=0
var total_pain=0
var selected_tool = "FINGER"


func _ready():
	for hair in $Culo1/Hairy.get_children():
		hair_number=hair_number+1
		
	print(hair_number)


func _process(delta):
	# $HUD/ProgressBar.get_
	pass
	
func another_hair_bites_the_dust(extraction_tool, extraction_perfection, hair_zone):
	pass
	

func _on_hot_wax_pressed():
	selected_tool = "HOT_WAX"
	print(selected_tool)


func _on_tweezers_pressed():
	selected_tool = "TWEEEZERS"
	print(selected_tool)


func _on_pull_pressed():
	selected_tool = "PULL"
	print(selected_tool)
