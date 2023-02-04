extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var tipo_pelo=0
export var aleatorio=true

# Called when the node enters the scene tree for the first time.
func _ready():
	if aleatorio:
		tipo_pelo=randi()% $Strands.hframes*$Strands.vframes
	
	update_hair_type()

func update_hair_type():
	$Strands.frame=tipo_pelo
	var scaling=rand_range(0.6,1.4)
	scale=scale*Vector2(scaling,scaling)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
