extends KinematicBody2D

var at_right_wall = false
var at_left_wall = false

var whale_speed = Vector2(500, 0)


func _process(delta):
	move_whale()

func move_whale():
	if global_position.x < 0:
		whale_speed *= -1;
		$AnimatedSprite.set_flip_h(true)
	elif global_position.x > GLOBAL.screen_width:
		whale_speed *= -1;
		$AnimatedSprite.set_flip_h(false)
	move_and_slide(whale_speed, Vector2(0, 1))
