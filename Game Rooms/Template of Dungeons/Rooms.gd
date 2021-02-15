extends Spatial

#types of rooms in order on the node tree
enum Type { SIDE, LR, LRB, LRT, LRTB }

#what rooms have opened going down 
const BOTTOM_OPENED := [Type.LRB, Type.LRTB]
const BOTTOM_CLOSED := [Type.LR, Type.LRT]

#Size of the room    set to vector 3 
var room_size := Vector2.ZERO
var cell_size := Vector3.ZERO

var _rng := RandomNumberGenerator.new()

# use _notification insted of ready so it runs when called from anotehr sceen 
func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_INSTANCED:
		_rng.randomize()

		var room: GridMap = $Side.get_child(0)
		# needs to be changed to work in 3d
		room_size = room.get_used_rect().size
		cell_size = room.cell_size

# gets the room information 
func get_room_data(type: int) -> Array:
	var group: Spatial = get_child(type)
	#checks the number of rooms in catagory 
	var index := _rng.randi_range(0, group.get_child_count() - 1)
	var room: GridMap = group.get_child(index)

	var data := []
	for v in room.get_used_cells():
		data.push_back({"offset": v, "cell": room.get_cellv(v)})
	return data
