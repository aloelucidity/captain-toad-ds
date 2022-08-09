extends Control

func _process(delta):
	for child in get_children():
		child.text = " " + str(GlobalVars.coins).pad_zeros(4)
