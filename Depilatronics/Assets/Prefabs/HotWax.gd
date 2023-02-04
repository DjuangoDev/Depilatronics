extends Node2D

var longo=1
var waxing=false
var time_from_init=-1

export var time_to_fix=100
export var max_angle=15 

var old_position=null
var direction=null
var extended=0

func _ready():
	longo=global_position.distance_to($Tip.global_position)
	
func _process(delta):
	var parar=false
	
	if waxing:
#		var mouse_position=get_global_mouse_position()
#		var direction_=Vector2(global_position.x-mouse_position.x,global_position.y-mouse_position.y).normalized()		
#
#		if OS.get_system_time_msecs()-time_from_init< time_to_fix or direction==null:
#			direction=direction_
#
#		if rad2deg(direction.angle_to(direction_))<max_angle:
#			$HotWax.rect_size.x=abs(mouse_position.distance_to(global_position))
#			look_at(mouse_position)
#		else:		
#			end_waxing(old_position)
#			direction=null
#
#		old_position=mouse_position
		var mouse_position=get_global_mouse_position()
		
		var in_body=false
		var overlapping=$HotWax/TipCol.get_overlapping_areas()
		for area in overlapping:
			if area.is_in_group("Body"):
				in_body=true
		
		if in_body:
			if OS.get_system_time_msecs()-time_from_init< time_to_fix:
				look_at(mouse_position)
		
			var longi=abs(mouse_position.distance_to(global_position))
			if longi>extended:
				$HotWax.rect_size.x=longi
				$HotWax/TipCol.position.x=$HotWax.rect_size.x
				$HotWax/TipCol.position.y=$HotWax.rect_size.y/2
				extended=longi
		
func init_waxing(position_):
	position=position_
	waxing=true
	time_from_init=OS.get_system_time_msecs()
	extended=0
	
func end_waxing(position_):
	waxing=false
