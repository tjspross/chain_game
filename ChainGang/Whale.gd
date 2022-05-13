extends KinematicBody2D
#extends RigidBody2D

var at_right_wall = false
var at_left_wall = false

var whale_velocity = Vector2(150, 0)
var default_rotation = 0.0

#func _integrate_forces(state):
#	move_whale_by_force()
#
#
#func move_whale_by_force():
#	if global_position.x < 0:
#		whale_velocity = Vector2(500, 0)
#		global_position.x = 0;
#		$AnimatedSprite.set_flip_h(true)
#	elif global_position.x > GLOBAL.screen_width:
#		whale_velocity = Vector2(-500, 0)
#		global_position.x = GLOBAL.screen_width
#		$AnimatedSprite.set_flip_h(false)
#	applied_force = whale_velocity

func _physics_process(delta):
	move_whale()

func move_whale():
	if global_position.x < 0:
		whale_velocity *= -1;
		$AnimatedSprite.set_flip_h(true)
	elif global_position.x > GLOBAL.screen_width:
		whale_velocity *= -1;
		$AnimatedSprite.set_flip_h(false)
	move_and_slide(whale_velocity, Vector2(0, 1))
