extends Area2D

func _ready():
	$AnimatedSprite.frame = rand_range(0, $AnimatedSprite.frames.get_frame_count("default"))

func collect(_body):
	GlobalVars.coins += 1
	get_parent().get_parent().get_node("Globals/Coin").play()
	queue_free()
