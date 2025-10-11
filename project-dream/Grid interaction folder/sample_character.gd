extends Node2D
var moving: bool = false
var line_positions: PackedVector2Array = []
var index: int = 1
var mouse: Vector2
@onready var destination = $"Destination line"

func _process(delta: float) -> void:
	if moving == true:
		Dynamic_Destination()
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and moving != true:
			moving = true
			destination.add_point(mouse,index )
	pass # Replace with function body.

func Dynamic_Destination():
	mouse = get_global_mouse_position()
	destination.set_point_position(index, mouse)
	pass
	
func reset_line():
	index = 1 
	line_positions.clear()
	pass
