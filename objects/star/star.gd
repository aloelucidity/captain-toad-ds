extends Area2D


func body_entered(body):
	get_tree().change_scene("res://MissionSelect.tscn")
