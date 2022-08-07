extends Area2D

func grab_object():
	var turnip = preload("res://objects/veggie/turnip.tscn").instance()
	turnip.global_position = Vector2(0, -INF)
	turnip.set_process(false)
	get_parent().add_child(turnip)
	
	$base.region_rect.position.x = 16
	$CollisionShape2D.disabled = true
	return turnip
