extends Node2D
var x = 0
var host
func _ready():
	var host = $ColorRect
	$ColorRect.color = Color.BLACK
	await get_tree().create_timer(0.5).timeout
	Globals.Fading_In(host)
	
	

func _on_texture_button_pressed():
	var host = $ColorRect
	Globals.Fading_Out(host)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Town.tscn")
	pass # Replace with function body.
