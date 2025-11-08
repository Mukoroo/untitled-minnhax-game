extends Node2D

var event_scene = preload("res://Scenes/event.tscn")

## Generate a copy of the list of all available events from available_events.tscn. This is our deck of events for this scene.
@onready var availableEvents = $AvailableEvents.availableEvents.duplicate(true)

var pickedEvent = ""
var playerChoice = ""

func _ready() -> void:
	print("Event manager ready")


func generate_event():
	pick_event()
	var event = event_scene.instantiate() ##TODO: set relevant details in the Event scene from the picked event
	$Events.add_child(event)
	$".."/ChoiceUI.fill_event_ui()
	

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
	
