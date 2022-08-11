extends Node2D

var scene
func _ready():
	var bg1 = load(GlobalVars.bg).instance()
	$ViewportContainer/Viewport.add_child(bg1)
	var bg2 = load(GlobalVars.bg).instance()
	bg2.get_node("ParallaxBackground").queue_free()
	$ViewportContainer2/Viewport.add_child(bg2)
	
	scene = load(GlobalVars.mission).instance()
	$ViewportContainer/Viewport.add_child(scene)
	$ViewportContainer2/Viewport.world_2d = $ViewportContainer/Viewport.world_2d
	
	$ViewportContainer/Viewport/Camera2D.follow = scene.get_node("Globals/Player")
	$ViewportContainer2/Viewport/Camera2D.follow = scene.get_node("Globals/Player")
