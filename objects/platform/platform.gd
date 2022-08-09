tool
extends KinematicBody2D

onready var left = $Left
onready var middle = $Middle
onready var right = $Right
onready var collision = $CollisionShape2D

export var follow_path : NodePath
onready var follow_node = get_node(follow_path)

export(int) var segments = 0 setget setter, getter
export var segment_width : int
export var edge_width : int

func setter(value):
	segments = value
	resize()

func getter():
	return segments

func _ready():
	collision.shape = RectangleShape2D.new()
	collision.shape.extents.y = 5
	resize()

func _physics_process(delta):
	if !is_instance_valid(follow_node): return
	position = follow_node.position

func resize():
	if !is_instance_valid(right): return
	middle.rect_size.x = segments * segment_width
	var total_size = (middle.rect_size.x + 20)
	
	middle.rect_position.x = -(total_size / 2) + 10
	left.rect_position.x = middle.rect_position.x - 10
	right.rect_position.x = middle.rect_position.x + middle.rect_size.x
	
	collision.position.x = middle.rect_position.x + (middle.rect_size.x/2)
	collision.shape.extents.x = total_size / 2
