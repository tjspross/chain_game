extends Node2D

var Chain = preload("res://Chain.tscn")
var start_pos := Vector2.ZERO
var end_pos := Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton and !event.is_pressed():
		if start_pos == Vector2.ZERO:
			start_pos = get_global_mouse_position()
		elif end_pos == Vector2.ZERO:
			end_pos = get_global_mouse_position()
			var chain = Chain.instance()
			add_child(chain)
			chain.spawn_chain(start_pos, end_pos)
			start_pos = Vector2.ZERO
			end_pos = Vector2.ZERO
			
			 
