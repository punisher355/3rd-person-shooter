extends KinematicBody

export var target_health = 10 
const Scrap = preload('res://Interactables/Metal Scrap.tscn')
var sr = 5

func OnHit(dammage):
	target_health -= dammage
	print(target_health)
	if target_health <= 0:
		sr = randi()%4 +3
		scrap()

func scrap():
	if sr > 0:
		var scrap = Scrap.instance()
		scrap.global_transform.origin = global_transform.origin
		get_parent() .add_child(scrap)
		sr -= 1
		scrap()
	if sr <= 0:
		queue_free()
