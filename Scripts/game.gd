extends Node2D

var debug_placeholder_scene = preload("res://Scenes/Debug/Placeholder.tscn")
var placeholder_loaded = false

func _ready() -> void:
	print("Game ready")

func _process(_delta: float) -> void:
	get_player_input()

func _on_load_placeholder_pressed() -> void:
	$DEBUGAspectRatioContainer.queue_free()
	var placeholder = debug_placeholder_scene.instantiate() ##TODO: set relevant details in the Event scene from the picked event
	placeholder.position = Vector2(576, 324)
	add_child(placeholder)
	placeholder_loaded = true

func get_player_input() -> void:
	if placeholder_loaded: ## TODO: Update to 'If we're in an episode'
		if Input.is_action_just_pressed("Choice1"):
			print("Player chose 1")
			$Placeholder/EventManager.playerChoice = "choice1"
			$Placeholder/EventManager.update_Debug_UI()
		if Input.is_action_just_pressed("Choice2"):
			print("Player chose 2")
			$Placeholder/EventManager.playerChoice = "choice2"
			$Placeholder/EventManager.update_Debug_UI()
	if Input.is_action_just_pressed("Pause"):
		print("Player paused")
