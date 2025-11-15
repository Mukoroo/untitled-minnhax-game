extends Node2D

var event_manager_scene = preload("res://Scenes/event_manager.tscn")
var event_manager_loaded = false
var player_can_choose = false

signal end_episode

@onready var timer = $EpisodeTimer

func _ready() -> void:
	print("Episode manager ready")


func _process(_delta: float) -> void:
	# If the timer is active, update the UI timer
	if timer.time_left:
		$HBoxContainer/TimeRemainingLabel2.text = str(ceil(timer.time_left))
		## TODO: actively listening for player input, else stop listening for that input
	
	$ChoiceUI.timer_amt = timer.time_left

func _on_start_ep_button_pressed() -> void:
	## At the start of every episode
	## TODO: trigger all this automatically rather than on button press, when episode intro has completed
	
	# Instantiate event manager
	var event_manager = event_manager_scene.instantiate() ## TODO: set relevant details in the Event scene from the picked event
	add_child(event_manager)
	event_manager_loaded = true
	
	# Start the episode timer
	## TODO: Update to 60 seconds. Currently 15 seconds for easier testing the flow.
	timer.start(15)  ## timer.start(60)
	# Make sure event deck is a clean copy, then serve the first event
	reset_events()
	pull_event()

func _on_episode_timer_timeout() -> void:
	## When the episode timer is up
	# Update UI timer
	$HBoxContainer/TimeRemainingLabel2.text = "Time up!"
	# Disable player choice input
	player_can_choose = false
	# Set the event deck back to a clean copy
	reset_events()
	
	#Send Signal to Game scene when timer is up
	end_episode.emit()
	


func pull_event():
	# Serve up an event from the deck and enable player input
	if timer.time_left:
		$EventManager.generate_event()
		player_can_choose = true

func reset_events():
	$EventManager.reset_events()
