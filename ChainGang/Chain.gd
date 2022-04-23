extends Node

var ChainLink = preload("res://ChainLink.tscn")
var link_length := 4.0
var chain_links := []
var chain_close_tolerance := 4.0

onready var chain_start_link = $ChainStartLink
onready var chain_end_link = $ChainEndLink

func spawn_chain(start_pos:Vector2, end_pos:Vector2):
	chain_start_link.global_position = start_pos
	chain_end_link.global_position = end_pos
	start_pos = chain_start_link.get_node("CollisionShape/Joint").global_position
	end_pos = chain_end_link.get_node("CollisionShape/Joint").global_position
	
	var distance = start_pos.distance_to(end_pos)
	print(distance)
	var link_amount = round(distance / link_length)
	var spawn_angle = (end_pos - start_pos).angle() - PI/2
	
	create_chain(link_amount, chain_start_link, end_pos, spawn_angle)
	
func create_chain(link_amount:int, parent:Object, end_pos:Vector2, spawn_angle:float):
	print(link_amount) #0...
	for i in link_amount:
		parent = add_link(parent, i, spawn_angle)
		parent.set_name("chain_link_"+str(i))
		print(parent)
		chain_links.append(parent)
		
		var joint_pos = parent.get_node("CollisionShape/Joint").global_position
		if joint_pos.distance_to(end_pos) < chain_close_tolerance:
			break
	chain_end_link.get_node("CollisionShape/Joint").node_a = chain_end_link.get_path()
	chain_end_link.get_node("CollisionShape/Joint").node_b = chain_links[0].get_path()

func add_link(parent:Object, id:int, spawn_angle:float) -> Object:
	var joint : PinJoint2D = parent.get_node("CollisionShape/Joint") as PinJoint2D
	var link : Object = ChainLink.instance() as Object
	link.global_position = joint.global_position
	link.rotation = spawn_angle
	link.parent = self
	link.id = id 
	add_child(link)
	print(parent.get_path())
	#link.node_a = parent.get_path()
	#link.node_b = link.get_path()
	
	return link
	

