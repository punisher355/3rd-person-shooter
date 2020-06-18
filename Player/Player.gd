extends KinematicBody

#Movement varables
const ACCELERATION = .2
const MAX_SPEED = .5
const FRICTION = 1

#gravity variables
var gravity = .6
var velocityg = Vector3.ZERO

var jump_hight = 20

var velocity = Vector3.ZERO

#Priamry weapon varables  
const Primary = preload('res://Player/Primary/Primary.tscn')
var Primary_rof = 0

#cam varables  
var mouse_sensitivity = Global.mouse_sensitivity
var mouse_inversion = Global.mouse_inversion

var camera_angle = 0

#movement function
func _physics_process(_delta):
	var Movement = Vector3.ZERO
	
	Movement.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	Movement.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#JacklRabbit from discord created the below line 
	Movement = Movement.rotated(Vector3.UP,deg2rad($Boddy.get_rotation_degrees().y))
	
	velocityg.y -= gravity
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocityg.y = jump_hight
	
	Movement = Movement.normalized()

	
	if Movement != Vector3.ZERO:
		velocity = velocity.move_toward(Movement * MAX_SPEED, ACCELERATION) 
	else:
		velocity = velocity.move_toward(Vector3.ZERO ,FRICTION)

	#moving and gavity 
	move_and_collide(velocity)
	velocityg = move_and_slide(velocityg,Vector3(0, 1, 0))

#Camera function
func _input(event): 
	if event is InputEventMouseMotion:
		$Boddy.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		
		if mouse_inversion == true:
			var change = event.relative.y * mouse_sensitivity
			if change + camera_angle < 0 and change + camera_angle > -90:
				$Boddy/Head.rotate_x(deg2rad(change))
				camera_angle += change
		elif mouse_inversion == false:
			var change = -event.relative.y * mouse_sensitivity
			if change + camera_angle < 0 and change + camera_angle > -90:
				$Boddy/Head.rotate_x(deg2rad(change))
				camera_angle += change

func _process(_delta):
	#checks if varables change
	mouse_sensitivity = Global.mouse_sensitivity
	mouse_inversion = Global.mouse_inversion
	
	# Lock on function
	if Input.is_action_pressed("Target"):
		pass
		
	#count up towards next shot
	Primary_rof += 1
		
	# Shooting function
	if Input.is_action_pressed("fire") and Primary_rof >= 40:#make changable for driffrent gear
		Primary_rof = 0
		var priamry = Primary.instance()
		priamry.start($Boddy/right_hand.global_transform)
		get_parent() .add_child(priamry)
		

func _on_Lock_on_Radius_body_entered(body):
	if body. is_in_group("Wall"):
		body.OnHit()
