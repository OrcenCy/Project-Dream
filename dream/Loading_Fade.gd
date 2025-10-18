extends ColorRect

func Fading_Out(): 
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(0,0,0,225), 5.0)
	print("kys")
	pass
	
func fade_In():
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property(self, "modulate", Color(0,0,0,1), 5.0)
	pass
	
	
