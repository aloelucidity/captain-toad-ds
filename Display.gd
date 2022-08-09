extends Node2D

export var scene_path : String
var scene

func _ready():
	scene = load(scene_path).instance()
	$ViewportContainer/Viewport.add_child(scene)
	$ViewportContainer2/Viewport.world_2d = $ViewportContainer/Viewport.world_2d
	
	$ViewportContainer/Viewport/Camera2D.follow = scene.get_node("Globals/Player")
	$ViewportContainer2/Viewport/Camera2D.follow = scene.get_node("Globals/Player")
