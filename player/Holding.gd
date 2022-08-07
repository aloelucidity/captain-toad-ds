extends Node

var held_object
var sprite = Sprite.new()
onready var character = get_parent()

export var animations_path : NodePath
onready var animations = get_node(animations_path)

func _ready():
	add_child(sprite)
	sprite.z_index = 1
	sprite.z_as_relative = true

func update():
	if is_instance_valid(held_object):
		sprite.flip_h = (character.facing_direction == -1)
		animations.prefix = "hold"
	else:
		animations.prefix = ""

func grab(object):
	held_object = object
	sprite.texture = object.held_texture
	sprite.offset = object.held_offset

func throw():
	held_object.throw(
		character.global_position, 
		character.facing_direction, 
		character.velocity
	)
	sprite.texture = null
	held_object = null
