extends VBoxContainer

#resolution varables 
var RESOLUTION_SETTINGS = [Vector2(1920, 1080), Vector2(1600, 900), Vector2(1366, 768),
Vector2(1280, 720), Vector2(1024, 576)]
var resolution:Vector2

func _ready():
	add_items()
	
# displays the mouse inverson and window settings
func _process(_delta):
	if Global.window == true:
		$Window/window.text = "WINDOWED BORDERLESS"
	elif Global.window == false:
		$Window/window.text = "WINDOWED"

	if Global.mouse_inversion == true:
		$Inverted_Mouse/inverted_mouse.text = "INVERTED Y"
	elif Global.mouse_inversion == false:
		$Inverted_Mouse/inverted_mouse.text = "NORMAL"

	$Volume/volume.value = Global.volume
	$Mouse_Sensitivity/mouse_sensitivity.value = Global.mouse_sensitivity * 10
	#print(OS.get_window_size())
	$Resolution/resolution.select(RESOLUTION_SETTINGS.find(OS.get_window_size()))
	
	
func add_items():
	# adds the resolutions to the resolution select
	for x in RESOLUTION_SETTINGS.size():
		var v = RESOLUTION_SETTINGS[x]
		$Resolution/resolution.add_item(str(v.x) + " x " + str(v.y), x)

#applies the selected resolution to the game
func _on_resolution_item_selected(id):
	resolution = RESOLUTION_SETTINGS[id]
	set_resolution()

func set_resolution():
	OS.set_window_size(resolution)
	Global.resolution = resolution

#window toggle
func _on_Window_pressed():
	Global.window = !Global.window
	OS.set_borderless_window(!OS.window_borderless)

# volume controllS
func _on_Volume_value_changed(value):
	Global.volume = value

# inverted mouse check box
func _on_Inverted_Mouse_pressed():
	Global.mouse_inversion = !Global.mouse_inversion

# change mouse Sensitivity
func _on_Mouse_Sensitivity_value_changed(value):
	Global.mouse_sensitivity = value * .1
