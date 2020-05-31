extends Button
	
const save_path = "res://Options.cfg"
var config = ConfigFile.new()
# creating dictionary of settings to be saved
var _settings = {
	"Options": {
		"resolution": Global.resolution,
		"windowed": Global.window,
		"Volume": Global.volume,
		"mouse inversion": Global.mouse_inversion,
		"mouse sensitivity": Global.mouse_sensitivity,
	}
}


func _on_Save_Settings_pressed():
	_settings = {
	"Options": {
		"resolution": Global.resolution,
		"windowed": Global.window,
		"Volume": Global.volume,
		"mouse inversion": Global.mouse_inversion,
		"mouse sensitivity": Global.mouse_sensitivity,
	}
}
	save_value() 
	
#settings being saved
func save_value():
	for section in _settings.keys():
		for key in _settings[section]:
			config.set_value(section, key, _settings[section][key])
	config.save(save_path)
	print("saved options")

func _on_Button_pressed():
	load_value()

func load_value():
	for section in _settings.keys():
		for key in _settings[section]:
			_settings[section][key] = config.get_value(section, key ,null)
	print ("loaded")
