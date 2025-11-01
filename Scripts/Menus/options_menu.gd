extends Control

func _ready() -> void:
	print("Options menu ready")
	$AspectRatioContainer/Control2/VBoxContainer.get_child(0).grab_focus.call_deferred()

func _on_back_pressed() -> void:
	print("Going back to main menu")
	get_tree().change_scene_to_file("res://Scenes/Menus/Main Menu.tscn")
