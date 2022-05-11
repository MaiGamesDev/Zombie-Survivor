extends RigidBody2D

var direction = Vector2.ZERO
var speed = 0
var time = 0

func _ready():
	linear_velocity = direction * speed
	
	yield(get_tree().create_timer(time), "timeout")
	queue_free()
