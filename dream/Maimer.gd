extends Node2D
var x = 0

func _on_texture_button_pressed():
	$ColorRect.visible = true
	$ColorRect.Fading_Out()
	await get_tree().create_timer(2.5).timeout
	$Library.visible = true
	$Town.visible = false
	await get_tree().create_timer(0.5).timeout
	$ColorRect.Fading_In()
	await get_tree().create_timer(2.5).timeout
	$ColorRect.visible = false
	pass # Replace with function body.


func _on_texture_button_2_pressed():
	$ColorRect.visible = true
	$ColorRect.Fading_Out()
	await get_tree().create_timer(2.5).timeout
	$Town.visible = true
	$Library.visible = false
	await get_tree().create_timer(0.5).timeout
	$ColorRect.Fading_In()
	await get_tree().create_timer(2.5).timeout
	$ColorRect.visible = false
	pass # Replace with function body.
