extends Control

@onready var metric_progress_1: TextureProgressBar = %MetricProgress1
@onready var metric_progress_2: TextureProgressBar = %MetricProgress2
@onready var metric_progress_3: TextureProgressBar = %MetricProgress3
@onready var metric_progress_4: TextureProgressBar = %MetricProgress4

@onready var label_event_text: Label = %LabelEventText

@onready var character_portrait: PanelContainer = %CharacterPortrait

func _ready() -> void:
	blank_event_ui()
	pass

#Connect To Event Manager


func update_metrics():
	#Update Progress #TODO: Link to eventual Metric Counter
	metric_progress_1.value = 45
	metric_progress_2.value = 45
	metric_progress_3.value = 45
	metric_progress_4.value = 45



#Grab Picked Event and fill out ChoiceUI with the correct info!
func fill_event_ui():
	#Fill in Character Portrait with correct Image
	#character_portrait.
	%LabelEventText.text = $".."/EventManager.pickedEvent.description
	$CenterContainer/PanelContainer/VBoxContainer/Bottom/VBoxContainer/HBoxChoices/ButtonChoice1.text = $".."/EventManager.pickedEvent.choice1
	$CenterContainer/PanelContainer/VBoxContainer/Bottom/VBoxContainer/HBoxChoices/ButtonChoice2.text = $".."/EventManager.pickedEvent.choice2
	pass

func blank_event_ui():
	# Set ChoiceUI with blank details on first load
	%LabelEventText.text = ""
	$CenterContainer/PanelContainer/VBoxContainer/Bottom/VBoxContainer/HBoxChoices/ButtonChoice1.text = ""
	$CenterContainer/PanelContainer/VBoxContainer/Bottom/VBoxContainer/HBoxChoices/ButtonChoice2.text = ""
	
##Choice Button Signal Connections
#On Choice made, emit signal to inform next step of process
#Event Manager?
func _on_button_choice_1_pressed() -> void:
	pass # Replace with function body.


func _on_button_choice_2_pressed() -> void:
	pass # Replace with function body.
