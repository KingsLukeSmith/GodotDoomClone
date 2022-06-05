extends KinematicBody

onready var nav = get_tree().get_nodes_in_group("NavMesh")[0]
onready var player = get_tree().get_nodes_in_group("Player")[0]

var path = [] #hold the path coordinates from the enemy to the player
var path_index = 0 #keep track of which coordinate to go to
var speed = 3
var health = 20
var move = true

func _ready():
	pass
	
func take_damage(dmg_amount):
	health -= dmg_amount
	if health <= 0:
		death()
		return
	move = false
	$AnimatedSprite3D.play("hit")
	yield($AnimatedSprite3D,"animation_finished")
	#$AnimatedSprite3D.play("walking")
	move = true


	
func _physics_process(delta):
	if path_index < path.size():


		var direction = (path[path_index] - global_transform.origin)
		if direction.length() < 1:
			path_index += 1
		else:
			if move:
				$AnimatedSprite3D.play("walking")###
				move_and_slide(direction.normalized() * speed, Vector3.UP)

		

	
func find_path(target):
	path = nav.get_simple_path(global_transform.origin,target)
	path_index = 0
	
func death():
	set_process(false)
	set_physics_process(false)
	$CollisionShape.disabled = true
	if health < -20:
		$AnimatedSprite3D.play("explode")
	else:
		$AnimatedSprite3D.play("die")
	
func shoot(target):
	pass


func _on_Timer_timeout():
	find_path(player.global_transform.origin)
