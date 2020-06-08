extends Control

var max_armor = 10
var armor_remaining = 10
var primary_ammo = 500
var secondary_ammo = 100
var shoulder_ammo = 10

func _process(_delta):
	$HBoxContainer/left_hud/Health.text = 'armor:' + str(max_armor) + "-" + str(armor_remaining)
	$HBoxContainer/right_hud/VBoxContainer2/primary_ammo.text = "primary weapon ammo:" + str(primary_ammo)
	$HBoxContainer/right_hud/VBoxContainer2/secondary_ammo.text = "secondary weapon ammo:" + str(secondary_ammo)
	$HBoxContainer/right_hud/VBoxContainer2/shoulder_ammo.text = "shoulder weapon ammo:" + str(shoulder_ammo)


