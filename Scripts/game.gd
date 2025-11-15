extends Node2D


var episode_manager_scene = preload("res://Scenes/episode_manager.tscn")
var episode_manager_loaded = false

var summary_ui_scene = preload("res://Scenes/SummaryUI/summary_ui.tscn")

@onready var prod_text = producer_text.new()
@onready var tutorial_step: int = 0

func _ready() -> void:
	print("Game ready")
	## Get producer's tutorial text and set initial dialog for first step of tutorial
	$DEBUGAspectRatioContainer/TutorialContainer/VBoxContainer/ProducerTutorialText.text = prod_text.tutorial_text[tutorial_step]

func _process(_delta: float) -> void:
	get_player_input()

func get_player_input() -> void:
	if episode_manager_loaded:
		if $EpisodeManager.player_can_choose:
			if Input.is_action_just_pressed("Choice1"):
				print("Player chose 1")
				$EpisodeManager/EventManager.playerChoice = "choice1"
				$EpisodeManager.player_can_choose = false
				Globals.player_chose_choice_1()
				$EpisodeManager/ChoiceUI.update_metrics()
				$EpisodeManager.pull_event()
			if Input.is_action_just_pressed("Choice2"):
				print("Player chose 2")
				$EpisodeManager/EventManager.playerChoice = "choice2"
				$EpisodeManager.player_can_choose = false
				Globals.player_chose_choice_2()
				$EpisodeManager/ChoiceUI.update_metrics()
				$EpisodeManager.pull_event()
	if Input.is_action_just_pressed("Pause"): 
		## TODO: define and implement pause behaviour 
		## TODO: define in which states the player can and can't pause
		print("Player paused")

## HANDLING THE TUTORIAL ##

## Player chooses tutorial
func _on_tutorial_next_pressed() -> void:
	# Hide the SkipTutorial button
	$DEBUGAspectRatioContainer/TutorialContainer/VBoxContainer/VBoxButtonsContainer/SkipTutorial.hide()
	# Variable for TutorialNext button
	var TutorialNext = $DEBUGAspectRatioContainer/TutorialContainer/VBoxContainer/VBoxButtonsContainer/TutorialNext
	# Increment step, used for tracking where in the tutorial we are
	tutorial_step += 1
	
	## Amend text on TutorialNext button
	if (tutorial_step == 1):
		TutorialNext.text = "Sounds easy!"
	if (tutorial_step == 2):
		TutorialNext.text = "Okay, I will"
	if (tutorial_step == 3):
		TutorialNext.text = "I'm ready, let's go!"
	
	## For steps prior to final step, update producer dialog text
	if(tutorial_step < 4):
		$DEBUGAspectRatioContainer/TutorialContainer/VBoxContainer/ProducerTutorialText.text = prod_text.tutorial_text[tutorial_step]
	## When on final step, load episode, exactly as SkipTutorial button does
	else:
		_on_skip_tutorial_pressed()

func _on_skip_tutorial_pressed() -> void:
	## Remove tutorial UI
	$DEBUGAspectRatioContainer.queue_free()
	## Instantiate episode manager and have it load episodes
	var episode_manager = episode_manager_scene.instantiate()
	add_child(episode_manager)
	episode_manager_loaded = true
	
	#Connect signal from EpisodeManager to End Episode function
	episode_manager.end_episode.connect(_on_end_episode_pressed)

func _on_end_episode_pressed() -> void:
	var summary_ui = summary_ui_scene.instantiate()
	$CanvasLayerUI.add_child(summary_ui)
	
	#TODO: Basic Function for the when Summary is over to move to the next Episode!
	summary_ui.summary_done.connect(on_summary_ui_summary_done)

#Called when SummaryUI is done
func on_summary_ui_summary_done():
	print("NEXT EPISODE")
	#SummaryUI is automatically Destroyed WITHIN SUMMARYUI
	
	
