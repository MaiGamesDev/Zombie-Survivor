extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func shoot(speed, time):
	var bullet = load("res://Bullet.tscn").instance()
	bullet.position = $FirePos.global_position
	bullet.direction = Vector2(0, -1).rotated(deg2rad(global_rotation_degrees)).normalized()
	bullet.speed = speed
	bullet.time = time
	get_tree().get_root().add_child(bullet)
