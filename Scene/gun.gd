extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_shoot = true
onready var gunsprite = $CanvasLayer/GunSprite
onready var gun_rays = $GunRays.get_children()
onready var flash = preload("res://Scene/MuzzleFlash.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func check_hit():
	for ray in gun_rays:
		if ray.is_colliding():
			print(ray.name, "is hitting", ray.get_collider().name)
			if ray.get_collider().is_in_group("Enemy"):
				ray.get_collider().take_damage(8)
		else:
			print(ray.name," missed")

func make_flash():
	var f = flash.instance()
	add_child(f)

func _process(delta):
	if Input.is_action_just_pressed("shoot") and can_shoot:
		gunsprite.play("shoot")
		make_flash()
		check_hit()
		can_shoot = false
		yield(gunsprite,"animation_finished")
		print("done")
		gunsprite.play("idle")
		can_shoot = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
