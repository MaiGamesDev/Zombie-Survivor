extends KinematicBody2D

onready var animState = $PlayerAnimTree.get("parameters/playback")

var velocity = Vector2.ZERO
var max_speed = 80
var accel_power = 10
var decel_power = 5

var bingbing = 0


func _physics_process(delta):
	get_input(delta)
	move_and_slide(velocity)
	
	rotate_weapon(bingbing)
	bingbing += 10
	
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
	
func rotate_player(value):
	$Tween.interpolate_property(self, "rotation_degrees", rotation_degrees, value, 0.1,$Tween.TRANS_LINEAR, $Tween.EASE_IN)
	$Tween.start()
	
func rotate_weapon(value):
	$Tween.interpolate_property($Weapon, "rotation_degrees", rotation_degrees, value, 0.1,$Tween.TRANS_LINEAR, $Tween.EASE_IN)
	$Tween.start()


	
