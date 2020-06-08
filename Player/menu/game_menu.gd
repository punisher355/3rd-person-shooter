extends Control

var pause = false

func _process(_delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		pause = !pause
		pause()
		
func pause():
	if pause == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_node(".").show()
		get_tree().paused = true
		
	if pause == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_node(".").hide()
		get_tree().paused = false


func _on_equipment_pressed():
	pass # Replace with function body.


func _on_items_pressed():
	pass # Replace with function body.


func _on_map_pressed():
	#$"VBoxContainer/HBoxContainer2/map".show()
	$"VBoxContainer/HBoxContainer2/Options".hide()
	$"VBoxContainer/HBoxContainer2/Quit".hide()
	
	
func _on_options_pressed():
	#$"VBoxContainer/HBoxContainer2/map".hide()
	$"VBoxContainer/HBoxContainer2/Options".show()
	$"VBoxContainer/HBoxContainer2/Quit".hide()
		
func _on_quit_pressed():
	#$"VBoxContainer/HBoxContainer2/map".hide()
	$"VBoxContainer/HBoxContainer2/Options".hide()
	$"VBoxContainer/HBoxContainer2/Quit".show()
