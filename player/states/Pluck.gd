extends State

export var stop_time := 0.0

var ground_timer = 0.0
var jump_timer = 0.0
var stop_timer = 0.0
var area

export var detector_path : NodePath
onready var grab_detector = get_node(detector_path)

export var holding_path : NodePath
onready var holding = get_node(holding_path)

func _start_check(_delta):
	return jump_timer > 0 && ground_timer > 0

func _start(delta):
	area = grab_detector.get_overlapping_areas()[0]
	jump_timer = 0
	stop_timer = stop_time

func _update(delta):
	stop_timer -= delta

func _stop(_delta):
	holding.grab(area.grab_object())

func _stop_check(_delta):
	return stop_timer <= 0

func _general_update(delta):
	if character.grounded:
		ground_timer = 0.2
	
	if is_instance_valid(holding):
		if is_instance_valid(holding.held_object):
			jump_timer = 0
	if is_instance_valid(grab_detector):
		if grab_detector.get_overlapping_areas().size() > 0:
			if character.inputs["jump"][1]:
				jump_timer = 0.2
	
	if jump_timer > 0:
		jump_timer -= delta
		if jump_timer <= 0:
			jump_timer = 0
	
	if ground_timer > 0:
		ground_timer -= delta
		if ground_timer <= 0:
			ground_timer = 0
