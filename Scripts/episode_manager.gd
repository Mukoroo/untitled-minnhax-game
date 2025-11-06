extends Node2D

var event_manager_scene = preload("res://Scenes/event_manager.tscn")
var event_manager_loaded = false
var player_can_choose = false


@onready var timer = $EpisodeTimer

func _ready() -> void:
	print("Episode manager ready")


func _process(_delta: float) -> void:
	if timer.time_left:
		$HBoxContainer/TimeRemainingLabel2.text = str(ceil(timer.time_left))
		## TODO: actively listening for player input, else stop listening for that input

func _on_start_ep_button_pressed() -> void:
	var event_manager = event_manager_scene.instantiate() ## TODO: set relevant details in the Event scene from the picked event
	event_manager.position = Vector2(576, 324)
	add_child(event_manager)
	event_manager_loaded = true
	timer.start(15)  ## DEBUG timer.start(60)
	reset_events()
	pull_event()

func _on_episode_timer_timeout() -> void:
	$HBoxContainer/TimeRemainingLabel2.text = "Time up!"
	reset_events()

func pull_event():
	if timer.time_left:
		$EventManager.generate_event()
	player_can_choose = true

func reset_events():
	$EventManager.reset_events()
