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
	## Set initial value for metrics
	metric_progress_1.value = 45
	metric_progress_2.value = 45
	metric_progress_3.value = 45
	metric_progress_4.value = 45


func update_metrics(player_choice):
	#Update Progress #TODO: Link to eventual Metric Counter
	## 1,2,3,4 = Passion, Emotion, Spectacle, Drama
	if(player_choice == 1):
		metric_progress_1.value += Globals.picked_event.choice_1_passion_effect
		metric_progress_2.value += Globals.picked_event.choice_1_emotion_effect
		metric_progress_3.value += Globals.picked_event.choice_1_spectacle_effect
		metric_progress_4.value += Globals.picked_event.choice_1_drama_effect
	
	if(player_choice == 2):
		metric_progress_1.value += Globals.picked_event.choice_2_passion_effect
		metric_progress_2.value += Globals.picked_event.choice_2_emotion_effect
		metric_progress_3.value += Globals.picked_event.choice_2_spectacle_effect
		metric_progress_4.value += Globals.picked_event.choice_2_drama_effect



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
# On choice button pressed, trigger player selection behaviour in game.gd
func _on_button_choice_1_pressed() -> void:
	Input.action_press("Choice1") ## This is a hack, but works while keeping controller support intact in game.gd
	Input.action_release("Choice1")

func _on_button_choice_2_pressed() -> void:
	Input.action_press("Choice2") ## This is a hack, but works while keeping controller support intact in game.gd
	Input.action_release("Choice2") 
