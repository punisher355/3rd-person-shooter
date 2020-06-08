extends Control


func _ready():
	pass # Replace with function body.


func _on_titlescreen_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Title screen/Title screen.tscn")


func _on_closegame_pressed():
	get_tree().quit()
