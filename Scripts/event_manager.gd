extends Node2D

var event_scene = preload("res://Scenes/event.tscn")

@onready var availableEvents = $AvailableEvents.availableEvents.duplicate(true) ## Generate a copy of the list of all available events from available_events.tscn. This is our deck of events for this scene.

var pickedEvent = ""
var playerChoice = ""

func _ready() -> void:
	print("Event manager ready")
	$MainContainer/HBoxContainer/VBoxContainer/RemainingEvents/Label2.text = str(len(availableEvents)) ## TEMP


func generate_event():
	pick_event()
	var event = event_scene.instantiate() ##TODO: set relevant details in the Event scene from the picked event
	$Events.add_child(event)
	update_Debug_event_UI()
	

func pick_event():
	print("Picking event")
	## Pick a random event, then remove it from the deck of events, so we don't get repeat picks
	if len(availableEvents) > 0:
		pickedEvent = availableEvents.pick_random()
		var index = availableEvents.find(pickedEvent, 0)
		availableEvents.pop_at(index)
		#playerChoice = "" ## DEBUG: Why is this here? This is causing playerChoice to reset
		## This probably DOES need to clear player choice at some point after the event picks. Just not instantly
	else:
		push_error("No available events left in event_manager availableEvents") ## Should only throw this error if the player speeds through all available events in too short a time. We need enough events to cover this.
		
func reset_events():
	### Reset the deck, get the full list of events from available_events.tscn
	print("Resetting events")
	availableEvents = $AvailableEvents.availableEvents.duplicate(true)
	#update_Debug_UI()
	
func update_Debug_event_UI():
	## Chosen event details
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/EventName/Label2.text = pickedEvent.name
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/EventType/Label2.text = pickedEvent.type
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/EventDescription/Label2.text = pickedEvent.description
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/Choice1/Label2.text = pickedEvent.choice1
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/Choice2/Label2.text = pickedEvent.choice2

func update_Debug_playerChoice_UI():
	## Player chose details
	#$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = pickedEvent.choice1 ## TODO: Update this to reflect the player's actual choice
	if(playerChoice == "choice1"): ## BUG: only updates after deck is empty
		$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = pickedEvent.choice1
	elif(playerChoice == "choice2"): ## BUG: only updates after deck is empty
		$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = pickedEvent.choice2
	else:
		$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = ""
	
	
	## Events remaining details
	$MainContainer/HBoxContainer/VBoxContainer/RemainingEvents/Label2.text = str(len(availableEvents))
	
