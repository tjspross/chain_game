extends RigidBody2D


#will need to use a rigid body because the kinematic bodies are kinda like static bodies that move
#I want it to be based in the physics engine, so controls will need to be force-based.

#when the mouse moves to the right, it can't just jump to the right immediately
#It needs to apply some amount of force to the body. such that it can't pull away from the chain


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
