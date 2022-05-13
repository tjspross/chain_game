extends Node2D


var OLDChain = preload("res://ChainGang/GenerativeChain/Chain.tscn")
#var Chain = preload("res://ChainGang/SimpleChain/SimpleChainGenerator.tscn")
var start_pos
var end_pos := Vector2.ZERO
#want to control the current_link of the SimpleChainGenerator
#instead of passing control to the next current chain link.
#Have a controller object that is moved down each time and set to node_b of the pinjoint of the prior link
#
#
func _input(event):
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
#	if event is InputEventMouseButton:
#		if event.button_index == BUTTON_LEFT and event.pressed:
#
#			start_pos = $Player.get_position()
#			end_pos = get_global_mouse_position()
#			#no end pos if we're just generating the chain constantly 
#			#will need a timer to generate the chain slowly enough.
#			var chain = OLDChain.instance()
#			add_child(chain)
#			#chain.spawn_first_chain_link(start_pos)
#			chain.spawn_chain(start_pos, end_pos)
