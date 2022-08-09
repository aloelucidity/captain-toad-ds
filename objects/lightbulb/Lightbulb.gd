extends Area2D

export var connect_path : NodePath
onready var connect = get_node(connect_path)

func _ready():
	$Sprite.region_rect.position.x = 0 if connect.activated else 16

func hit(body):
	get_parent().get_node("Globals/Switch").play()
	connect.activated = !connect.activated
	$Sprite.region_rect.position.x = 0 if connect.activated else 16
