extends KinematicBody2D

onready var animState = $PlayerAnimTree.get("parameters/playback")

var velocity = Vector2.ZERO
export var max_speed = 150
var accel_power = 10
var decel_power = 5

var bingbing = 0


func _physics_process(delta):
	get_input(delta)
	move_and_slide(velocity)
	
	rotate_weapon(bingbing)
	bingbing += 2
	
func get_input(delta):
	# 움직임
	var dir = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		dir.x = 1
	elif Input.is_action_pressed("move_left"):
		dir.x = -1
	if Input.is_action_pressed("move_backwards"):
		dir.y = 1
	if Input.is_action_pressed("move_towards"):
		dir.y = -1
	
	if dir != Vector2.ZERO:
		rotate_player(rad2deg(dir.angle()))

	velocity = dir * max_speed
	
	if animState.get_current_node() != "move" and dir != Vector2.ZERO:
		animState.travel("move")
	if animState.get_current_node() == "move" and dir == Vector2.ZERO:
		animState.travel("idle")
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			$Weapon.shoot(100, 2)
		
func rotate_player(value):
	rotation_degrees = value
	
func rotate_weapon(value):
	$Weapon.global_rotation_degrees = value

func rotate_weapon_to(target):	
	var direction = look_at(target.global_position)
	$Weapon.global_rotation_degrees = direction

func die():
	pass
	
func _on_WeaponCool_timeout():
	$Weapon.shoot(100, 2)
	$WeaponCool.wait_time = 0.2


func _on_HurtCollision_area_entered(area):
	die()
