extends Node

var resolution:Vector2
var window = false
var volume = -10
var mouse_inversion = true
var mouse_sensitivity = .3


func _process(_delta):
	if (Input.is_action_pressed("ui_cancel")):
		get_tree().quit()
		
	
	if(Input.is_action_pressed("ui_accept")):
		get_tree().change_scene("res://Title screen/Title screen.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
