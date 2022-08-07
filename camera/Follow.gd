extends Camera2D

var follow
export var follow_speed : float

func _physics_process(delta):
	if !is_instance_valid(follow): return
	global_position.x = lerp(global_position.x, follow.global_position.x, delta * follow_speed)
	global_position.y = lerp(global_position.y, follow.global_position.y, delta * follow_speed)
