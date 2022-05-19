extends KinematicBody

onready var camera = $Pivot/Camera

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002  # radians/pixel

onready var pistol = preload("res://Scene/Pistol.tscn")
onready var shotgun = preload("res://Scene/Shotgun.tscn")
onready var rocket = preload("res://Scene/RocketLauncher.tscn")
var current_gun = 0
onready var guns = [pistol,shotgun,rocket]

var velocity = Vector3()
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func get_input():
	var input_dir = Vector3()
	# desired move in camera direction
	if Input.is_action_pressed("move_forward"):
		input_dir += -global_transform.basis.z
	if Input.is_action_pressed("move_back"):
		input_dir += global_transform.basis.z
	if Input.is_action_pressed("strafe_left"):
		input_dir += -global_transform.basis.x
	if Input.is_action_pressed("strafe_right"):
		input_dir += global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir
	
func _unhandled_input(event):
	if event is InputEventMouseMotion: #and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 1.2)
		
func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed

	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)


func change_gun(gun):
	$Pivot/Gun.get_child(0).queue_free()
	var new_gun = guns[gun].instance()
	$Pivot/Gun.add_child(new_gun)
	
func _process(delta):
	#change gun
	if Input.is_action_just_pressed("next_gun"):
		current_gun +=1
		if current_gun > len(guns) -1 :
			current_gun = 0
		change_gun(current_gun)
	elif Input.is_action_just_pressed("prev_gun"):
		current_gun -=1
		if current_gun <0:
			current_gun = len(guns)-1
		change_gun(current_gun)
		
		
