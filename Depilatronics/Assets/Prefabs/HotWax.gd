extends Node2D

var longo=1
var waxing=false

func _ready():
	longo=global_position.distance_to($Tip.global_position)
	
func _process(delta):
	if waxing:
		var mouse_position=get_global_mouse_position()
		$HotWax.rect_size.x=abs(mouse_position.distance_to(global_position))
		look_at(mouse_position)

func init_waxing(position_):
	position=position_
	waxing=true

func end_waxing(position_):
	waxing=false
