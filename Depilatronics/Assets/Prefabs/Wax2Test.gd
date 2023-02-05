extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lon=[0,0]
var direccion=null

var final=false
export var minimum_length=10
export var width=30

var seleccionado=false
var encima=false

# Called when the node enters the scene tree for the first time.
func _ready():
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
	if Input.is_action_pressed("pinchar"):
		if encima:
			$Banda2.visible=true
			$Banda2.points[1]=get_global_mouse_position()
			var longi=$Banda2.points[1].distance_to($Banda2.points[0])		
			longi2=lon[0]+lon[1]-longi
			$Banda.points[1]=$Banda.points[0]+longi2*direccion
			$Banda2.points[0]=$Banda.points[1]

			$ini/CollisionShape2D.position=$Banda.points[0]
			$end/CollisionShape2D.position=$Banda2.points[1]
			
			if $Banda.points[1].distance_to($Banda.points[0])<minimum_length:
				final=true
				$Banda.visible=false
				


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
