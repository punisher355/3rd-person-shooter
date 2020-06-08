extends KinematicBody

var target_health = 10 


func OnHit(dammage):
	target_health -= dammage
	print(target_health)
	if target_health <= 0:
		queue_free()

