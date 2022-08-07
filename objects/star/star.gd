extends LevelObject

# functions
func load_object():
	var scene = preload("res://level/objects/star/star.tscn").instance()
	add_child(scene)
	
	loaded = true
	return self
