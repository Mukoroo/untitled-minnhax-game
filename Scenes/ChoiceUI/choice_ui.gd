extends Control

@onready var metric_progress_1: TextureProgressBar = %MetricProgress1
@onready var metric_progress_2: TextureProgressBar = %MetricProgress2
@onready var metric_progress_3: TextureProgressBar = %MetricProgress3
@onready var metric_progress_4: TextureProgressBar = %MetricProgress4
@onready var button_choice_1: Button = %ButtonChoice1
@onready var button_choice_2: Button = %ButtonChoice2

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



#Is given Picked Event and fill out ChoiceUI with the correct info!
func fill_event_ui(picked_event : Event):
	#Use Picked Event information to fill out info!
	
	label_event_text.text = picked_event.description
	%ButtonChoice1.text = picked_event.choice_1_text
	%ButtonChoice2.text = picked_event.choice_2_text

func blank_event_ui():
	# Set ChoiceUI with blank details on first load
	%LabelEventText.text = ""
	%ButtonChoice1.text = ""
	%ButtonChoice2.text = ""
	
##Choice Button Signal Connections
#On Choice made, emit signal to inform next step of process
#Event Manager?
func _on_button_choice_1_pressed() -> void:
	Input.action_press("Choice1") ## This is a hack, but works while keeping controller support intact in game.gd
	Input.action_release("Choice1")



func _on_button_choice_2_pressed() -> void:
	Input.action_press("Choice2") ## This is a hack, but works while keeping controller support intact in game.gd
	Input.action_release("Choice2") 
