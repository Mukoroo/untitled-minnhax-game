extends Node2D


var episode_manager_scene = preload("res://Scenes/episode_manager.tscn")
var episode_manager_loaded = false

var summary_ui_scene = preload("res://Scenes/SummaryUI/summary_ui.tscn")

func _ready() -> void:
	print("Game ready")

func _process(_delta: float) -> void:
	get_player_input()

func get_player_input() -> void:
	if episode_manager_loaded:
		if $EpisodeManager.player_can_choose:
			if Input.is_action_just_pressed("Choice1"):
				print("Player chose 1")
				$EpisodeManager/EventManager.playerChoice = "choice1"
				$EpisodeManager.player_can_choose = false
				$EpisodeManager/ChoiceUI.update_metrics(1)
				$EpisodeManager.pull_event()
			if Input.is_action_just_pressed("Choice2"):
				print("Player chose 2")
				$EpisodeManager/EventManager.playerChoice = "choice2"
				$EpisodeManager.player_can_choose = false
				$EpisodeManager/ChoiceUI.update_metrics(2)
				$EpisodeManager.pull_event()
	if Input.is_action_just_pressed("Pause"): 
		## TODO: define and implement pause behaviour 
		## TODO: define in which states the player can and can't pause
		print("Player paused")


func _on_go_to_episode_pressed() -> void:
	$DEBUGAspectRatioContainer.queue_free()
	var episode_manager = episode_manager_scene.instantiate()
	add_child(episode_manager)
	episode_manager_loaded = true
	
	#Connect signal from EpisodeManager to End Episode function
	episode_manager.end_episode.connect(_on_end_episode_pressed)

func _on_end_episode_pressed() -> void:
	var summary_ui = summary_ui_scene.instantiate()
	$CanvasLayerUI.add_child(summary_ui)
	
	#TODO: Basic Function for the when Summary is over to move to the next Episode!
	summary_ui.summary_done.connect(func(): print("NEXT EPISODE"))
	
