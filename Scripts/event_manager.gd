extends Node2D

@onready var csv_file_path: String = "res://Resources/DropCSVHere/Maximum Drama Events - Sheet1(4).csv"

var event_scene = preload("res://Scenes/event.tscn")

## Moved available events to EventManager so it's all in one Script.
##Helped avoid CSV parsing issues.
var availableEvents : Array[Event]

#Now an Event based system
var pickedEvent : Event
var playerChoice = ""

func _ready() -> void:
	#print("Event manager ready")
	create_event_list()

func create_event_list():
	availableEvents = load_csv_as_array(csv_file_path)
	availableEvents.shuffle()

func generate_event():
	## When an event is needed
	# Choose a random event from the deck
	pick_event()
	# Instantiate it as a scene. ##TODO: Check if this is really needed in current implementation
	var event = event_scene.instantiate() ##TODO: set relevant details in the Event scene from the picked event
	$Events.add_child(event)
	Globals.picked_event = pickedEvent
	
	# Update the choice UI with the event details
	#Sends Picked Event to ChoiceUI so that ChoiceUI can have access to all Event information
	$".."/ChoiceUI.fill_event_ui(pickedEvent)
	

func pick_event():
	## Pick a random event, then remove it from the deck of events, so we don't get repeat picks
	if len(availableEvents) > 0:
		pickedEvent = availableEvents.pick_random()
		
		#Removes used Event from AvailableEvents
		var index = availableEvents.find(pickedEvent, 0)
		availableEvents.pop_at(index)
		#playerChoice = "" ## DEBUG: Why is this here? This is causing playerChoice to reset
		## This probably DOES need to clear player choice at some point after the event picks. Just not instantly
	else:
		# Throw an error if there are no events left in the deck
		push_error("No available events left in event_manager availableEvents") ## Should only throw if the player speeds through all available events in too short a time. We need enough events to make this impossible to happen in normal play.
		
func reset_events():
	## Reset the deck, get the full list of events from available_events.tscn
	print("Resetting events")
	availableEvents = load_csv_as_array(csv_file_path)



####################################################
##Function for transferring CSV to Available Events
####################################################
func load_csv_as_array(csv_path : String, ) -> Array[Event]:
	
	#Store Results
	var read_events : Array[Event] 
	
	#Load file with READ access
	var file = FileAccess.open(csv_path, FileAccess.READ)
	
	#Abort if no File Loaded
	if !file:
		push_error("No CSV Found:", csv_path)
		return read_events
	
	#Iterate over each line of csv and append it
	#TODO: Format each line's data into an array of resources
	while not file.eof_reached():
		var line = file.get_line()
		#print("LINE")
		#print(line)
		
		var current_line : Array
		
		#Stores each Value from Line as a item of Array
		
		
		current_line = line.split(",")
		
		#Check if first value is TRUE, Just to make sure no bad rows go through
		#print(current_line.get(0))
		if current_line.get(0) == "TRUE":
			var new_event : Event = Event.new()
			
			new_event.name = current_line[1]
			
			#Type
			if current_line.get(2) == "Personal":
				new_event.type = Event.EventType.Personal
			elif current_line.get(2) == "Generic":
				new_event.type = Event.EventType.Generic
			
			#Description
			new_event.description = current_line.get(3)
			new_event.description = turn_semi_colon_to_comma(new_event.description)
			
			#Choice 1 variables
			new_event.choice_1_text = current_line.get(4)
			new_event.choice_1_text = turn_semi_colon_to_comma(new_event.choice_1_text)
			new_event.choice_1_passion_effect = int(current_line.get(5))
			new_event.choice_1_emotion_effect = int(current_line.get(6))
			new_event.choice_1_spectacle_effect = int(current_line.get(7))
			new_event.choice_1_drama_effect = int(current_line.get(8))
			
			#Choice 2 variables
			new_event.choice_2_text = current_line.get(9)
			new_event.choice_2_text = turn_semi_colon_to_comma(new_event.choice_2_text)
			new_event.choice_2_passion_effect = int(current_line.get(10))
			new_event.choice_2_emotion_effect = int(current_line.get(11))
			new_event.choice_2_spectacle_effect = int(current_line.get(12))
			new_event.choice_2_drama_effect = int(current_line.get(13))
			
			#print("TESTING")
			#print(new_event)
			
			read_events.append(new_event)
		
	
	#Close file after read function is complete
	file.close()
	
	return read_events

func turn_semi_colon_to_comma(given_string : String) -> String:
	var new_string = given_string.replace(";", ",")
	return new_string
