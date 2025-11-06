extends Node2D


var episode_manager_scene = preload("res://Scenes/episode_manager.tscn")
var episode_manager_loaded = false

func _ready() -> void:
	print("Game ready")

func _process(_delta: float) -> void:
	get_player_input()

func get_player_input() -> void:
	if episode_manager_loaded: ## TODO: Update to 'If we're in an episode'
		if $EpisodeManager.player_can_choose:
			if Input.is_action_just_pressed("Choice1"):
				print("Player chose 1")
				$EpisodeManager/EventManager.playerChoice = "choice1"
				print("break")
				$EpisodeManager/EventManager.update_Debug_playerChoice_UI()
				print("updating debug UI and player choice is: ", $EpisodeManager/EventManager.playerChoice)
				$EpisodeManager.player_can_choose = false
				$EpisodeManager.pull_event()
			if Input.is_action_just_pressed("Choice2"):
				print("Player chose 2")
				$EpisodeManager/EventManager.playerChoice = "choice2"
				$EpisodeManager/EventManager.update_Debug_playerChoice_UI()
				print("updating debug UI and player choice is: ", $EpisodeManager/EventManager.playerChoice)
				$EpisodeManager.player_can_choose = false
				$EpisodeManager.pull_event()
	if Input.is_action_just_pressed("Pause"): ## TODO: define and implement pause behaviour ## TODO: define in which states the player can and can't pause
		print("Player paused")


func _on_go_to_episode_pressed() -> void:
	$DEBUGAspectRatioContainer.queue_free()
	var episode_manager = episode_manager_scene.instantiate()
	add_child(episode_manager)
	episode_manager_loaded = true
