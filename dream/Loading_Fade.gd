extends ColorRect

func Fading_Out(): 
	print("kys")
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property(self, "modulate", Color(1,1,1,255), 2.0)
	pass
	
func Fading_In():
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property(self, "modulate", Color(1,1,1,1), 2.0)
	pass
	
	
