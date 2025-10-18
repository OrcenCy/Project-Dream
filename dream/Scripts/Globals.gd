extends Node

func Fading_Out(host): 
	host.visible = true
	print("kys")
	var tween = get_tree().create_tween()
	tween.tween_property(host, "modulate", Color.BLACK, 2.0)
	pass
	
func Fading_In(host):
	var tween = get_tree().create_tween()
	tween.tween_property(host, "modulate", Color.TRANSPARENT, 2.0)
	await get_tree().create_timer(2.5).timeout
	host.visible = false
	pass
