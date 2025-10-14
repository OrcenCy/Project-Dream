extends Node2D
class_name Obstacle

var passable: bool = false



#func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventMouseButton:
		#if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#passable = true
	#pass # Replace with function body.
