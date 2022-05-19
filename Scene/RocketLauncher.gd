extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_shoot = true
onready var gunsprite = $CanvasLayer/GunSprite
onready var rocket = preload("res://Scene/Rocket.tscn")
onready var spawn_location = $Position3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func launch_projectile():
	var new_rocket = rocket.instance()
	get_node("/root/World").add_child(new_rocket)
	new_rocket.global_transform = spawn_location.global_transform


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		print (spawn_location.global_transform)
		
func _process(delta):
	if Input.is_action_just_pressed("shoot") and can_shoot:
		gunsprite.play("shoot")
		launch_projectile()
		can_shoot = false
		yield(gunsprite,"animation_finished")
		gunsprite.play("idle")
		can_shoot = true
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
