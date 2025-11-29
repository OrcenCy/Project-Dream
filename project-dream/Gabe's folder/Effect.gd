extends Node
class_name effect

var duration: int 
var type: String 
var target

func _init(DURATION: int, TYPE: String) -> void:
	duration = DURATION
	type = TYPE
	
func activate():
	pass
	
func remove():
	pass
