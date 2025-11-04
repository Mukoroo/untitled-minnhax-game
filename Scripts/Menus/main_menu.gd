extends Control

func _ready() -> void:
	print("Main menu ready")
	$AspectRatioContainer/Control2/VBoxContainer.get_child(0).grab_focus.call_deferred()


func _on_start_game_pressed() -> void:
	print("Starting game")
	## TODO: Define game scene
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/Options Menu.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	print("exiting game")
	get_tree().quit()
