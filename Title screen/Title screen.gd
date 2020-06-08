extends Control

var options_visable = false

# newgame button
func _on_New_Game_pressed():
	get_tree().change_scene("res://Test map/Room.tscn")
  
#load game button
func _on_Load_Game_pressed():
	pass # Replace with function body.

#option button
func _on_Options_pressed():
	if options_visable == false:
		get_node("VBoxContainer/Options").show()
		options_visable = !options_visable
	else:
		get_node("VBoxContainer/Options").hide()
		options_visable = !options_visable

#close game button
func _on_Close_Game_pressed():
	get_tree().quit()
	

