extends Path2D

func _ready():
	$Line2D.points = curve.get_baked_points()
