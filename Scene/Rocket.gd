extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rocket_speed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	translate(Vector3.FORWARD * rocket_speed * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func deal_damage():
	#direct damage
	var enemies = get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("Enemy"):
			body.take_damage(60)
	#splash damage
	enemies = $SplashDamage.get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("Enemy"):
			body.take_damage(30)
	

func _on_Rocket_body_entered(body):
	set_process(false) # Replace with function body.
	$AnimatedSprite3D.play("explode")
	deal_damage()
	yield($AnimatedSprite3D,"animation_finished")
	
	queue_free()
