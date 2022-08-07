extends Node

export(float) var walk_accel
export(float) var turn_accel
export(float) var overshoot_accel

export(float) var friction
export(float) var air_friction

export(float) var walk_speed
export(float) var hold_speed

onready var character = get_parent()
var direction : int

export var holding_path : NodePath
onready var holding = get_node(holding_path)

func increment_towards(start, target, increment):
	if start > target:
		start -= increment
		if start <= target:
			start = target
	
	elif start < target:
		start += increment
		if start >= target:
			start = target
	
	return start

func handle_movement():
	if character.state != null && character.state.disable_movement:
		direction = 0
		return
	
	direction = 0
	if character.inputs["move_left"][0]:
		direction -= 1
	if character.inputs["move_right"][0]:
		direction += 1
	
	if direction != 0:
		var speed = walk_speed
		if is_instance_valid(holding):
			if is_instance_valid(holding.held_object):
				speed = hold_speed
		
		character.facing_direction = direction
		if (
			direction == 1 && character.velocity.x < speed || 
			direction == -1 && character.velocity.x > -speed
		):
			character.velocity.x = increment_towards(
				character.velocity.x,
				speed * direction,
				walk_accel
			)
		else:
			character.velocity.x = increment_towards(
				character.velocity.x,
				speed * direction,
				overshoot_accel
			)

func handle_friction():
	if character.grounded:
		if direction == 0:
			character.velocity.x = increment_towards(character.velocity.x, 0, friction)
		if direction != 0 && sign(character.velocity.x) != sign(direction):
			character.velocity.x = increment_towards(character.velocity.x, 0, turn_accel)
	else:
		if direction == 0:
			character.velocity.x = increment_towards(character.velocity.x, 0, air_friction)
		if direction != 0 && sign(character.velocity.x) != sign(direction):
			character.velocity.x = increment_towards(character.velocity.x, 0, walk_accel)

func update(_delta):
	handle_movement()
	handle_friction()
