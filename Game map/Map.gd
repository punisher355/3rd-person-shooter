extends Control

var map_size:Vector2
#var border_size = get_viewport().get_rect().size

func _process(_delta):
	#map_size.x = (border_size.x - 44)
	#map_size.y = (border_size.y - 40)
	map_size.x = 972
	map_size.y = 532
	$ViewportContainer.set_size(map_size)
	$ViewportContainer/Viewport.set_size(map_size)
