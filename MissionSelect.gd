extends Node2D

export(Dictionary) var stars
var star_nodes = []
var selected_star = 0

var can_input = true

func _input(event):
	if !can_input: return
	if event.is_action_pressed("move_left"):
		selected_star = wrapi(selected_star - 1, 0, stars.size())
		change_select()
	if event.is_action_pressed("move_right"):
		selected_star = wrapi(selected_star + 1, 0, stars.size())
		change_select()

func change_select():
	$Control/Polygon2D.position.x = star_nodes[selected_star].rect_position.x
	$Control/RichTextLabel3.bbcode_text = "[center]" + stars.keys()[selected_star] + "[/center]"

func select_mission():
	if selected_star == 0:
		GlobalVars.bg = "res://level/Background2.tscn"
	else:
		GlobalVars.bg = "res://level/Background.tscn"
	GlobalVars.mission = stars[stars.keys()[selected_star]]
	get_tree().change_scene("res://Display.tscn")

func pressed():
	if !can_input: return
	can_input = false
	$AnimationPlayer.play("select")

func _ready():
	for star in stars:
		var star_node = load("res://missions/Star.tscn").instance()
		$Control/HBoxContainer.add_child(star_node)
		star_nodes.append(star_node)
	yield(get_tree(), "idle_frame")
	change_select()
