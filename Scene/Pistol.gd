extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_shoot = true
onready var camera = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	if camera == null:
		return
	$RayCast.global_transform = camera.global_transform

func _process(delta):
	if camera == null:
		print("error")
		return
	if Input.is_action_just_pressed("shoot") and can_shoot:
		$GunSprite.play("shoot")
		can_shoot = false
		yield($GunSprite,"animation_finished")
		print("done")
		$GunSprite.play("idle")
		can_shoot = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
