extends RigidBody2D

onready var pin_joint = $CollisionShape2D/PinJoint2D

var id := -1
var parent : Object = null 

func _physics_process(delta):
	pass
	#maintain rotation?
	#keep bottom-most chain link from exceeding height of previous links?
