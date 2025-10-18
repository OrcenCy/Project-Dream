extends ColorRect

func fade_Out(): 
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 255.0, 0.0)
	pass
	
func fade_In():
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property(self, "modulate:a", 0.0, 2.0)
	pass
	
	
