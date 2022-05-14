extends KinematicBody2D

onready var player_path = "../Player"

var direction = Vector2(0,0)
export var speed = 60
var speed_mutiple = 1.0

func _physics_process(delta):
	if get_node(player_path) != null:
		move_to(player_path)
	else:
		set_physics_process(false)

func move_to(target):
	var targetnode = get_node(target)	
	var direction = (targetnode.position - position).normalized()
	move_and_slide(direction * speed * speed_mutiple)
	if direction.x != 0:
		$Sprite.scale.x =  -sign(direction.x)



func _on_HurtCollision_area_entered(area):
	queue_free()
