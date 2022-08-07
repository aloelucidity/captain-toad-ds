extends Character

export var held_texture : StreamTexture
export var held_offset : Vector2

export var throw_power : Vector2
export var throw_offset : Vector2

func _physics_process(delta):
	process_gravity(delta)
	apply_velocity(delta)

func throw(new_pos, direction, momentum):
	global_position = new_pos + throw_offset
	velocity = Vector2(throw_power.x * direction, throw_power.y)
	velocity += momentum / 2
