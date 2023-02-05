extends Control

onready var face := $face
onready var progress := $TextureProgress

func _ready():
	face.animation = "level1"

func _process(delta):
	if progress.value >= 100:
		face.animation = "dead"
	elif progress.value > 80:
		face.animation = "level3"
	elif progress.value > 50:
		face.animation = "level2"
	else:
		face.animation = "level1"

func add_pain(pain):
	progress.value = progress.value + pain
