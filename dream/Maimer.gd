extends Node2D






func _on_texture_button_pressed():
	$ColorRect.fade_Out()
	$Town.visible = false
	$Library.visible = true
	#$ColorRect/Timer.start()
	#_on_timer_timeout()
	pass # Replace with function body.


func _on_texture_button_2_pressed():
	$ColorRect.fade_Out()
	$Town.visible = true
	$Library.visible = false
	$ColorRect.fade_In()
	pass # Replace with function body.


func _on_timer_timeout():
	print("yo mama")
	$ColorRect.fade_In()
	pass # Replace with function body.
