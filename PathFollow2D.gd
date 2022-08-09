extends PathFollow2D

export var direction := -1
export var activated := true
export var reverses := true
export var speed := 0.1

func _physics_process(delta):
	if !activated: return
	var max_offset = get_parent().curve.get_baked_length()
	var move_amount = speed * direction
	offset = clamp(offset + move_amount, 0, max_offset)
	
	if !reverses: return
	if offset <= 0 || offset >= max_offset:
		direction = -direction
