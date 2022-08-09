extends Character
class_name Player

var camera = null
onready var animations = $Animations

func _init():
	GlobalVars.coins = 0

func _physics_process(delta):
	process_inputs()
	process_collisions(delta)
	update_states(delta)
	$Movement.update(delta)
	process_gravity(delta)
	$Holding.update()
	$Animations.update(delta)
	
	apply_velocity(delta)

func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
