extends KinematicBody2D

var direction = Vector2()
var speed = 0
var velocity = Vector2()
const MAX_SPEED = 400

enum {TOP, RIGHT, LEFT, DOWN}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	var is_moving = Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")
	if position.x < 0:
		position.x = 0
		is_moving = false
	elif position.x > 600:
		position.x = 600
		is_moving=false;
		
	if is_moving:
		speed = MAX_SPEED
	
		if Input.is_action_pressed("ui_right"):
			turn_towards(RIGHT)
		elif Input.is_action_pressed("ui_left"):
			turn_towards(LEFT)
		elif Input.is_action_pressed("move_up"):
			turn_towards(TOP)
		elif Input.is_action_pressed("move_down"):
			turn_towards(DOWN)
	else:
		speed = 0
	
	velocity = speed * direction
	move_and_slide(velocity)


func turn_towards(_direction):
	if _direction == TOP:
		pass
	elif _direction == DOWN:
		pass
	elif _direction == LEFT:
		direction = Vector2(-1, 0)
		# get_node("Sprite").set_flip_h(false)
	elif _direction == RIGHT:
		direction = Vector2(1, 0)
		# get_node("Sprite").set_flip_h(true)
