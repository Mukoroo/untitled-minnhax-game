extends Control

signal summary_done

func _ready() -> void:
	print("SummaryUI Ready")

func _on_button_next_pressed() -> void:
	summary_done.emit()
