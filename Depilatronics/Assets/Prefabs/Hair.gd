extends Area2D
class_name Hair


signal tip_touched(object)
signal hair_pulled(extraction_tool,hair_difficulty,extraction_quality)

export var pain=1
export var tipo_pelo=0
export var aleatorio=true
export var velocity=10


var falling=false


# Called when the node enters the scene tree for the first time.
func _ready():
	if aleatorio:
		tipo_pelo=randi()% $Strands.hframes*$Strands.vframes
	
	update_hair_type()

func update_hair_type():
	$Strands.frame=tipo_pelo
	$AnimationPlayer.play(str(tipo_pelo))
	var scaling=rand_range(0.6,1.4)
	scale=scale*Vector2(scaling,scaling)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if falling:
		position.y=position.y+delta*velocity	

#func _on_Hair_mouse_entered():
#	fall()

func fall():
	falling=true


func _on_Tip_mouse_entered():
	emit_signal("tip_touched",self)
	
func see_to(position_):
	pass


# extraction_quality = 1-3
func i_have_pulled_you(extraction_tool,extraction_quality):
	print("hair pulled")
	emit_signal("hair_pulled",extraction_tool,pain,extraction_quality)
	queue_free()
