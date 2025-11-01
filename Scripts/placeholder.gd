extends Control

func _ready() -> void:
	print("Placeholder scene ready")


	


func _on_exit_pressed() -> void:
	print("exiting game")
	get_tree().quit()
