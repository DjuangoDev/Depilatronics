extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lon=[0,0]
var direccion=null

var final=false
export var minimum_length=10
export var width=30
export var max_wax=100
export var hot_time=0.1

var length=0
var time=0
var init_time=0
var seleccionado=false
var encima=false
enum BandState  {PREPARED, SPREADING, SPREAD, PULLING, PULLED}
var bandState=BandState.PREPARED

var first_hand_position

# Called when the node enters the scene tree for the first time.
func _ready():
	
	first_hand_position=$first_hand_position.position
	
	lon[0]=$Banda.points[0].distance_to($Banda.points[1])
	lon[1]=$Banda2.points[0].distance_to($Banda2.points[1])
	direccion=($Banda.points[1]-$Banda.points[0]).normalized()
	$Banda.width=width
	$Banda2.width=width
	$ini/CollisionShape2D.shape.radius=width/2
	$end/CollisionShape2D.shape.radius=width/2
	
	$ini/CollisionShape2D.position=$Banda.points[0]
	$end/CollisionShape2D.position=$Banda.points[1]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var longi2
	var mouse_position=get_global_mouse_position()
	time=OS.get_ticks_msec()/1000.0
	
	if bandState==BandState.PREPARED:
		pass
	elif bandState==BandState.PULLED:
		pass
	elif bandState==BandState.PULLING:
		pass
	elif bandState==BandState.SPREADING:
		
		#var point=Geometry.get_closest_point_to_segment_uncapped_2d ( mouse_position, $Banda.points[0], $Banda.points[0]+direccion)
		$ManoCeraCaliente.position=mouse_position
		if time-init_time < hot_time:
			$Banda.points[1]=mouse_position
			direccion=($Banda.points[1]-$Banda.points[0]).normalized()
			length=$Banda.points[0].distance_to($Banda.points[1])
		#elif point.distance_to(mouse_position)<width/2:
		#	$Banda.points[1]=mouse_position
		else:
			var length_=mouse_position.distance_to($Banda.points[0])
			if length_>length:		
				$Banda.points[1]=$Banda.points[0]+direccion*mouse_position.distance_to($Banda.points[0])
				length=length_
					
#	if Input.is_action_pressed("pinchar"):
#		if encima:
#			$Banda2.visible=true
#			$Banda2.points[1]=get_global_mouse_position()
#			var longi=$Banda2.points[1].distance_to($Banda2.points[0])		
#			longi2=lon[0]+lon[1]-longi
#			$Banda.points[1]=$Banda.points[0]+longi2*direccion
#			$Banda2.points[0]=$Banda.points[1]
#
#			$ini/CollisionShape2D.position=$Banda.points[0]
#			$end/CollisionShape2D.position=$Banda2.points[1]
#
#			if $Banda.points[1].distance_to($Banda.points[0])<minimum_length:
#				final=true
#				$Banda.visible=false

func init_spreading(mouse_position):
	$Banda.points[0]=mouse_position
	$Banda.points[1]=mouse_position

	$Banda.visible=true
	
	bandState=BandState.SPREADING
	
	init_time=OS.get_ticks_msec()/1000.0
	
	$ManoCeraCaliente.visible=true
	$Tween.interpolate_property($ManoCeraCaliente, "position",
		first_hand_position, mouse_position, 0.25,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
func stop_spreading(mouse_position):

	#$Banda.points[1]=mouse_position
	if time-init_time < hot_time:
			$Banda.points[1]=mouse_position
	else:
		var length_=mouse_position.distance_to($Banda.points[0])
		if length_>length:		
			$Banda.points[1]=$Banda.points[0]+direccion*mouse_position.distance_to($Banda.points[0])
			length=length_

	$Banda.visible=true
	$ini/CollisionShape2D.position=$Banda.points[0]
	$end/CollisionShape2D.position=$Banda.points[1]
			
	bandState=BandState.SPREAD
	
	$Tween.interpolate_property($ManoCeraCaliente, "position",
		$ManoCeraCaliente.position, first_hand_position, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
func _on_ini_mouse_entered():
		encima=true

func _on_end_mouse_entered():
		encima=true
		var tmp=$Banda.points[1]
		$Banda.points[1]=$Banda.points[0]
		$Banda.points[0]=tmp
		

func _on_end_mouse_exited():
	encima=false
	
func _on_ini_mouse_exited():
	encima=false
