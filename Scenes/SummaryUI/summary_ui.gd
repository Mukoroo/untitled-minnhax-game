extends Control
@onready var label_drama: Label = %LabelDrama
@onready var label_passion: Label = %LabelPassion
@onready var label_emotion: Label = %LabelEmotion
@onready var label_spectacle: Label = %LabelSpectacle

signal summary_done

func _ready() -> void:
	print("SummaryUI Ready")
	label_drama.text = "Drama = " + str(Globals.current_drama) + "/" + "100"
	label_passion.text = "Passion = " + str(Globals.current_passion) + "/" + "100"
	label_emotion.text = "Emotion = " + str(Globals.current_emotion) + "/" + "100"
	label_spectacle.text = "Spectacle = " + str(Globals.current_spectacle) + "/" + "100"
	

func _on_button_next_pressed() -> void:
	summary_done.emit()
