extends Node2D

onready var player = get_parent().get_node("Player")

var ChainLink = preload("res://ChainGang/SimpleChain/SimpleChainLink.tscn")
var link_length := 16.0 #would be preferable to get the actual height of the colision shape through code
var chain_links := []
var chain_close_tolerance := 2.0

var first_link_spawned = false
var start_pos
var parent_joint_pos
var current_link

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if !first_link_spawned:
				start_pos = player.global_position
				spawn_first_chain_link(start_pos)
			else:
				spawn_next_chain_link(current_link, parent_joint_pos)
		if event.button_index == BUTTON_RIGHT and event.pressed:
			first_link_spawned = false
			#start_pos = $Player.get_position()
			#end_pos = get_global_mouse_position()
			#no end pos if we're just generating the chain constantly 
			#will need a timer to generate the chain slowly enough.

func spawn_first_chain_link(position:Vector2):
	first_link_spawned = true
	current_link = ChainLink.instance()
	current_link.mode = RigidBody2D.MODE_STATIC
	current_link.global_position = position
	add_child(current_link)
	parent_joint_pos = current_link.pin_joint.global_position 

func spawn_next_chain_link(parent:Object, position:Vector2): #, spawn_angle:float):
	current_link = ChainLink.instance()
	current_link.global_position = position + Vector2(0, link_length)
	add_child(current_link)
	var current_joint = current_link.pin_joint
	current_joint.node_a = parent.get_path()
	current_joint.node_b = current_link.get_path()
	parent_joint_pos = current_joint.global_position
	
#when a link is added, signal up to the parent
#when the signal is received, move the controlled_link down one.
	
#func create_chain(link_amount:int, parent:Object, end_pos:Vector2, spawn_angle:float):
#	print(link_amount) #0...
#	for i in link_amount:
#		parent = add_link(parent, i, spawn_angle)
#		parent.set_name("chain_link_"+str(i))
#		chain_links.append(parent)
#
#		var joint_pos = parent.get_node("CollisionShape/Joint").global_position
#		if joint_pos.distance_to(end_pos) < chain_close_tolerance:
#			break
#	chain_end_link.get_node("CollisionShape/Joint").node_a = chain_end_link.get_path()
#	chain_end_link.get_node("CollisionShape/Joint").node_b = chain_links[-1].get_path()
#
#func add_link(parent:Object, id:int, spawn_angle:float) -> Object:
#	var joint : PinJoint2D = parent.get_node("CollisionShape/Joint") as PinJoint2D
#	var link : Object = ChainLink.instance() as Object
#	link.global_position = joint.global_position
#	link.rotation = spawn_angle
#	link.parent = self
#	link.id = id 
#	add_child(link)
#	joint.node_a = parent.get_path()
#	joint.node_b = link.get_path()
#
#	return link
#
#
