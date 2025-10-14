extends Node2D
var Valid_point: bool = true
var moving: bool = false
#When i make a pathfollow2D for movement the each click will be added to the array which will be transfered to that node.
var line_positions: PackedVector2Array = []
var index: int = 1
#mouse tracks the local mouse position on a scene
var mouse: Vector2
# Variables used to directly access the related nodes
@onready var Line = $Path2D
@onready var destination = $"Destination line"
@onready var line_shape = $"Destination line/Dectection Area/CollisionShape2D"
@onready var Detection_area = $"Destination line/Dectection Area"
# pos a is the first position on the collision line. it moves whenever the character right clicks. 
#pos b is the dymaically shifting position on the line segmented line.
@onready var pos_b: Vector2 = line_shape.shape.b 
@onready var pos_a: Vector2 = line_shape.shape.a 


func _input(event):
	# Check for a left mouse button press event
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and moving == true:
		reset_line()
		moving = false
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT and moving == true:
		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT and moving == true :
			index += 1
			print("index printed")
			destination.add_point(mouse,index)
			#pos_a = mouse
			line_shape.shape.a = mouse
			line_positions.append(mouse)
		
func _process(delta: float) -> void:
	if moving == true:
		Validate_movement()
		Dynamic_Destination()
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and moving != true:
			moving = true
			destination.add_point(mouse,index)
			line_positions.append(mouse)
	pass # Replace with function body.

func Dynamic_Destination():
	mouse = get_local_mouse_position()
	destination.set_point_position(index, mouse)
	pos_b = mouse
	line_shape.shape.b = mouse
	pass
#Validate Movment is used to check the nature of overlapping bodies to ensure your can't leave the area that is 
func Validate_movement():
	var Items: Array[Area2D] = Detection_area.get_overlapping_areas()
	if Items.is_empty() == false:
		for i in range(Items.size()):
			if Items[i].is_in_group("Obstacle"):
				Valid_point = false
				destination.default_color = Color(1.0, 0.238, 0.52, 1.0)
				Items.clear()
	elif Items.is_empty() == true:
		Valid_point = true
		destination.default_color = Color(0.331, 2.338, 0.0, 1.0)
		print()
	Items.clear()
func reset_line():
	index = 1 
	destination.clear_points()
	var line: Vector2 = Vector2(destination.position.x, destination.position.y)
	print(line_positions)
	destination.add_point(line,0)
func Collsion_move():
	for i in range(line_positions.size()):
		Line.curve.add_point(line_positions[i])
	pass
