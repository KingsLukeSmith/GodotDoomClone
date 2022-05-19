extends KinematicBody

onready var nav = get_tree().get_nodes_in_group("NavMesh")[0]
onready var player = get_tree().get_nodes_in_group("Player")[0]
var path = []
var path_node = 0
var speed = 2
var health = 50

func _ready():
	pass

func take_damage(dmg):
	health -= dmg


func _physics_process(delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length()<1:
			path_node+=1
		else:
			move_and_slide(direction.normalized()*speed,Vector3.UP)
	if health < 0:
		death()	
		
func move_to(target):
	path = nav.get_simple_path(global_transform.origin, target)
	path_node = 0

func death():
	set_process(false)
	set_physics_process(false)
	$CollisionShape.disabled = true
	if health < -20:
		$AnimatedSprite3D.play("explode")
	else:
		$AnimatedSprite3D.play("die")
	
	

func _on_Timer_timeout():
	move_to(player.global_transform.origin) # Replace with function body.
