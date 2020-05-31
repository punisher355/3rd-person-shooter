extends Control

var options_visable = 1

# newgame button
func _on_New_Game_pressed():
	get_tree().change_scene("res://Test map/Room.tscn")
  
#load game button
func _on_Load_Game_pressed():
	pass # Replace with function body.

#option button
func _on_Options_pressed():
	if options_visable > 0:
		get_node("Options").show()
		options_visable -= 1
	else:
		get_node("Options").hide()
		options_visable += 1

#close game button
func _on_Close_Game_pressed():
	get_tree().quit()
	

