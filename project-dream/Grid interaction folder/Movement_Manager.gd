extends Node2D

#Movement manager you would add it to any given character and when you connect this make sure to 
@onready var parent_node = self.get_parent()
@onready var global_node
var line_scene = preload("res://Grid interaction folder/destination_line.tscn")
#Checks if the line is ever in the correct position. 
var Valid_point: bool = true
#Checks if the collision line is not touch anything in group obstacle. 
var moving: bool = false
#Start_movement makes the object move to it's conclusion
var Start_movement:bool = false
var line_positions: PackedVector2Array = []
var index: int = 1
#mouse tracks the local mouse position on a scene
var mouse: Vector2
# Variables used to directly access the related nodes
@onready var destination =$"BlueBodySquare/Destination line"
@onready var line_shape = $"BlueBodySquare/Destination line/Dectection Area/CollisionShape2D"
@onready var Detection_area = $"BlueBodySquare/Destination line/Dectection Area"
# pos a is the first position on the collision line. it moves whenever the character right clicks. 
#pos b is the dymaically shifting position on the line segmented line.


func _ready() -> void:
	global_node = parent_node.get_parent()
	destination.add_point(self.position)
	destination.add_point(parent_node.position)
	destination.visible = false
	

func _input(event):
	# Check for a left mouse button press event
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and moving == true:
		Collsion_move()
		moving = false
		Start_movement = true
	#this checks if the right mouse button was clicked and adds a new point
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT and moving == true:
		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT and moving == true and Valid_point == true:
			index += 1
			destination.add_point(mouse,index)
			line_positions.append(mouse)
			line_shape.shape.a  = mouse
			print(line_shape.shape.a)
		
func _process(delta: float) -> void:
	if moving == true:
		Validate_movement()
		Dynamic_Destination()
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if  event.pressed and event.button_index == MOUSE_BUTTON_LEFT and moving != true:
			queue_redraw()
			moving = true
			mouse = get_global_mouse_position()
		pass # Replace with function body.

func Dynamic_Destination():
	if destination.visible != true:
		destination.visible = true
	mouse = get_global_mouse_position()
	var local_mouse = get_global_mouse_position()  - parent_node.global_position
	destination.set_point_position(index, local_mouse)
	line_shape.shape.b  = local_mouse
	pass
#Validate Movment is used to check the nature of overlapping bodies to ensure your can't leave the area that is 
func Validate_movement():
	var Items: Array[Area2D] = Detection_area.get_overlapping_areas()
	if Items.is_empty() == false:
		for i in range(Items.size()):
			if Items[i].is_in_group("Obstacle"):
				Valid_point = false
				destination.default_color = Color(1.0, 0.238, 0.52, 1.0)
	elif Items.is_empty() == true:
		Valid_point = true
		destination.default_color = Color(0.331, 2.338, 0.0, 1.0)
	Items.clear()
	

func reset_line():
	line_positions.clear()
	destination.clear_points()
	destination.add_point(self.position)
	destination.add_point(parent_node.position)
	index = 1

func Collsion_move():
	destination.visible = false
	for target_position in line_positions:
		var tween := get_tree().create_tween()
		tween.tween_property(parent_node, "global_position", target_position, 1.0)
		await tween.finished
		destination.visible = false
		print("Moved to:", destination.global_position)
	reset_line()
