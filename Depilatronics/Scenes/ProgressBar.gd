extends Control

onready var face := $face
onready var progress := $TextureProgress

const MAX_PAIN = 100
const HIGH_PAIN = 80
const MEDIUM_PAIN = 50
const TILE_TELEPORT = 3

func _ready():
	face.animation = "level1"

func _process(delta):
	if progress.value >= MAX_PAIN:
		face.animation = "dead"
	elif progress.value > HIGH_PAIN:
		face.animation = "level3"
	elif progress.value > MEDIUM_PAIN:
		face.animation = "level2"
	else:
		face.animation = "level1"

func add_pain(pain):
	progress.value = progress.value + pain

func get_pain():
	return progress.value
