extends Control


#gets the players location 
onready var Target_XZ = get_tree().get_root().get_node("Room").find_node("Player")#need to change "Room" to somthing universal 
onready var Target_Y = get_tree().get_root().get_node("Room").find_node("Player")

onready var cam = get_node("ViewportContainer/Viewport/Camera")

var minimap_size = OS.get_window_size()
var Border_size = (minimap_size)


func _ready():
	pass

#has cam map follow player
func _physics_process(_delta):
	cam.translation.x = Target_XZ.get_global_transform().origin.x
	cam.translation.z = Target_XZ.get_global_transform().origin.z
	cam.translation.y = Target_Y.get_global_transform().origin.y + 40

#updates minimap size
func _process(_delta):
	minimap_size = (Global.resolution / 2) / 2
	Border_size.x = (minimap_size.x + 48)
	Border_size.y = (minimap_size.y + 40)
	set_size(Border_size)
	$ViewportContainer.set_size(minimap_size)
	$ViewportContainer/Viewport.set_size(minimap_size)

