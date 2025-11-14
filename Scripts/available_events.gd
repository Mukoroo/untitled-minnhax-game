extends Node2D

#var availableEvents = [
	#{"name":"Birthday", "type":"personal", "description":"It's my birthday, get me a present!", "choice1":"Something home made", "choice2":"Something expensive"},
	#{"name":"WorkLate", "type":"generic", "description":"I have to work late again tonight", "choice1":"Are you cheating?", "choice2":"You work so hard!"},
	#{"name":"Vacation", "type":"personal", "description":"My friends want me to come on vacation with them", "choice1":"Have a great break!", "choice2":"No way, I'll take you somewhere!"},
	#{"name":"Pet", "type":"generic", "description":"I want a pet!", "choice1":"That'll be so cute!", "choice2":"That'll be so much work!"},
	#{"name":"SephirothLove", "type":"personal", "description":"Do you still love me?", "choice1":"Your mommy issues are too much", "choice2":"Let's merge with the lifestream...together!"},
	#{"name":"Wedding+1", "type":"generic", "description":"Will you be my +1 to my cousin's wedding?", "choice1":"That sounds wonderful!", "choice2":"That sounds like a living hell!"},
	#{"name":"Parents", "type":"generic", "description":"My parents want to meet you", "choice1":"Let's go to dinner", "choice2":"Let's go do karaoke"},
	#{"name":"RobinHood", "type":"generic", "description":"I just stole Elon Musk's bitcoin wallet", "choice1":"Let's redistribute that wealth, comrade!", "choice2":"Hello, officer? Yes, this one right here!"},
	#{"name":"Gambling", "type":"generic", "description":"I've started playing high stakes poker and I feel like I have to keep chasing those wins", "choice1":"All in! I'll start shopping for five star hotel breaks!", "choice2":"Maybe you should ease off if it stops being fun"}
#]

var availableEvents : Array[Event]

@onready var csv_file_path: String = "res://Resources/DropCSVHere/Maximum Drama Events - Sheet1(1).csv"

func _ready() -> void:
	availableEvents = load_csv_as_array(csv_file_path)
	print(availableEvents)
	#print(availableEvents)

#Function for transferring CSV to Available Events
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
			
			#Choice 1 variables
			new_event.choice_1_text = current_line.get(4)
			new_event.choice_1_passion_effect = int(current_line.get(5))
			new_event.choice_1_emotion_effect = int(current_line.get(6))
			new_event.choice_1_spectacle_effect = int(current_line.get(7))
			new_event.choice_1_drama_effect = int(current_line.get(8))
			
			#Choice 2 variables
			new_event.choice_2_text = current_line.get(9)
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
