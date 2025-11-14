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
	# 1,2,3,4 = Passion, Emotion, Spectacle, Drama
	## Set initial value for metrics
	update_metrics()


#Now linked to Global, pulls variables, updates amounts.
func update_metrics():
	# 1,2,3,4 = Passion, Emotion, Spectacle, Drama
	
	metric_progress_1.value = Globals.current_passion
	metric_progress_2.value = Globals.current_emotion
	metric_progress_3.value = Globals.current_spectacle
	metric_progress_4.value = Globals.current_drama



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
	hover_choice_button(1, false)
	
##Choice Button Signal Connections
# On choice button pressed, trigger player selection behaviour in game.gd
func _on_button_choice_1_pressed() -> void:
	Input.action_press("Choice1") ## This is a hack, but works while keeping controller support intact in game.gd
	Input.action_release("Choice1")

func _on_button_choice_2_pressed() -> void:
	Input.action_press("Choice2") ## This is a hack, but works while keeping controller support intact in game.gd
	Input.action_release("Choice2") 


##Choice Button Hovering Effects
# 1,2,3,4 = Passion, Emotion, Spectacle, Drama
#Function for making Hint buttons for when making Choices pop up
func hover_choice_button(choice_1_or_2 : int, should_show_effect : bool):
	if should_show_effect:
		match choice_1_or_2:
			1:
				if Globals.picked_event.choice_1_passion_effect > 0:
					%TextureRectMinnMax1.visible = true
					#%TextureRectMinnMax1.flip_v = false
				elif Globals.picked_event.choice_1_passion_effect < 0:
					%TextureRectMinnMax1.visible = true
					#%TextureRectMinnMax1.flip_v = true
					
				if Globals.picked_event.choice_1_emotion_effect > 0:
					%TextureRectMinnMax2.visible = true
					#%TextureRectMinnMax2.flip_v = false
				elif Globals.picked_event.choice_1_emotion_effect < 0:
					%TextureRectMinnMax2.visible = true
					#%TextureRectMinnMax2.flip_v = true
					
				if Globals.picked_event.choice_1_spectacle_effect > 0:
					%TextureRectMinnMax3.visible = true
					#%TextureRectMinnMax3.flip_v = false
				elif Globals.picked_event.choice_1_spectacle_effect < 0:
					%TextureRectMinnMax3.visible = true
					#%TextureRectMinnMax3.flip_v = true
					
				if Globals.picked_event.choice_1_drama_effect > 0: 
					%TextureRectMinnMax4.visible = true
					#%TextureRectMinnMax4.flip_v = false
				elif Globals.picked_event.choice_1_drama_effect < 0:
					%TextureRectMinnMax4.visible = true
					#%TextureRectMinnMax4.flip_v = true
			2:
				if Globals.picked_event.choice_2_passion_effect > 0:
					%TextureRectMinnMax1.visible = true
					#%TextureRectMinnMax1.flip_v = false
				elif Globals.picked_event.choice_2_passion_effect < 0:
					%TextureRectMinnMax1.visible = true
					#%TextureRectMinnMax1.flip_v = true
					
				if Globals.picked_event.choice_2_emotion_effect > 0:
					%TextureRectMinnMax2.visible = true
					#%TextureRectMinnMax2.flip_v = false
				elif Globals.picked_event.choice_2_emotion_effect < 0:
					%TextureRectMinnMax2.visible = true
					#%TextureRectMinnMax2.flip_v = true
					
				if Globals.picked_event.choice_2_spectacle_effect > 0:
					%TextureRectMinnMax3.visible = true
					#%TextureRectMinnMax3.flip_v = false
				elif Globals.picked_event.choice_2_spectacle_effect < 0:
					%TextureRectMinnMax3.visible = true
					#%TextureRectMinnMax3.flip_v = true
					
				if Globals.picked_event.choice_2_drama_effect > 0: 
					%TextureRectMinnMax4.visible = true
					#%TextureRectMinnMax4.flip_v = false
				elif Globals.picked_event.choice_2_drama_effect < 0:
					%TextureRectMinnMax4.visible = true
					#%TextureRectMinnMax4.flip_v = true
	
	elif !should_show_effect:
		%TextureRectMinnMax1.visible = false
		%TextureRectMinnMax2.visible = false
		%TextureRectMinnMax3.visible = false
		%TextureRectMinnMax4.visible = false

func _on_button_choice_1_mouse_entered() -> void:
	hover_choice_button(1, true)


func _on_button_choice_1_mouse_exited() -> void:
	hover_choice_button(1, false)


func _on_button_choice_2_mouse_entered() -> void:
	hover_choice_button(2, true)


func _on_button_choice_2_mouse_exited() -> void:
	hover_choice_button(2, false)
