extends KinematicBody

#Movement varables
var gravity =  Vector3.DOWN * .8
var jump_speed = 25
var speed = 18
var velocity = Vector3()
var jump = false 
#anamation variables
onready var anim = get_node("Boddy/Armature/AnimationPlayer").get_animation("Idle")
onready var animt = get_node("Boddy/Armature/AnimationTree")
var anamation = Vector2()
#cam varables  

var mouse_sensitivity = Global.mouse_sensitivity
var mouse_inversion = Global.mouse_inversion
var camera_change = Vector2()
var camera_angle = 0

#Priamry weapon varables  
const Primary = preload('res://Player/Primary/Primary.tscn')
var Primary_rof = 0

#movement function
func _physics_process(_delta):
	velocity += gravity
	velocity = move_and_slide(velocity, Vector3.UP)
	jump= false
	velocity.x = 0
	velocity.z = 0
	velocity.x = Input.get_action_strength("ui_right") * speed - Input.get_action_strength("ui_left") * speed
	velocity.z = Input.get_action_strength("ui_down") * speed - Input.get_action_strength("ui_up") * speed
	velocity = velocity.rotated(Vector3.UP,deg2rad($Boddy.get_rotation_degrees().y))
	if Input. is_action_just_pressed("jump"):
		jump = true
	if jump and is_on_floor():
		velocity.y = jump_speed

func _process(_delta):
	#checks if varables change
	mouse_sensitivity = Global.mouse_sensitivity
	mouse_inversion = Global.mouse_inversion
	
	#calls other functions 
	Camera()
	Priamry_fire()
	lock_on()
	Animation()

func _input(event):  
	if event is InputEventMouseMotion:
		camera_change = event.relative

#Camera function
func Camera(): 
	$Boddy.rotate_y(deg2rad(-camera_change.x * mouse_sensitivity))
	if mouse_inversion == true:
		var change = camera_change.y * mouse_sensitivity
		if change + camera_angle < 0 and change + camera_angle > -90:
			$Boddy/Head.rotate_x(deg2rad(change))
			camera_angle += change
	elif mouse_inversion == false:
		var change = -camera_change.y * mouse_sensitivity
		if change + camera_angle < 0 and change + camera_angle > -90:
			$Boddy/Head.rotate_x(deg2rad(change))
			camera_angle += change
	camera_change = Vector2()

# Shooting function
func Priamry_fire():
	#count up towards next shot
	Primary_rof += 1

	if Input.is_action_pressed("fire") and Primary_rof >= 40:#make changable for driffrent gear
		Primary_rof = 0
		var priamry = Primary.instance()
		priamry.start($Boddy/right_hand.global_transform)
		get_parent() .add_child(priamry)

# lock_on function
func lock_on():
	if Input.is_action_pressed("Target"):
		pass

func _on_Lock_on_Radius_body_entered(body):
	if body. is_in_group("Wall"):
		body.OnHit()

#playes the Animation
func Animation():
	anamation.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	anamation.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	animt.set("parameters/running/blend_position", anamation)



