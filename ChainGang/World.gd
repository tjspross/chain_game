extends Node2D

var Chain = preload("res://ChainGang/Chain.tscn")
var start_pos 
var end_pos := Vector2.ZERO

	
func _input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			
			start_pos = get_node("Player").get_position()
			end_pos = get_global_mouse_position()
			
			var chain = Chain.instance()
			add_child(chain)
			chain.spawn_chain(start_pos, end_pos)
	
			
			 
