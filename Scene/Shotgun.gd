extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_shoot = true
onready var gunsprite = $CanvasLayer/GunSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("shoot") and can_shoot:
		gunsprite.play("shoot")
		can_shoot = false
		yield(gunsprite,"animation_finished")
		print("done")
		gunsprite.play("idle")
		can_shoot = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
