extends Node2D

# Level variables
var hair_number=0
var total_pain=0


# Called when the node enters the scene tree for the first time.
func _ready():
	for hair in $Culo1/Hairy.get_children():
		hair_number=hair_number+1
		
	print(hair_number)

# pulled hair Signals call this callback(): 
# extraction_perfection: 1-3
# hair_zone: 1-3
#

func _process(delta):
	# $HUD/ProgressBar.get_
	pass
	
func another_hair_bites_the_dust(extraction_tool, extraction_perfection, hair_zone):
	pass
	
