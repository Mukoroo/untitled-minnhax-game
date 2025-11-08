extends Node2D

var availableEvents = [
	{"name":"Birthday", "type":"personal", "description":"It's my birthday, get me a present!", "choice1":"Something home made", "choice2":"Something expensive"},
	{"name":"WorkLate", "type":"generic", "description":"I have to work late again tonight", "choice1":"Are you cheating?", "choice2":"You work so hard!"},
	{"name":"Vacation", "type":"personal", "description":"My friends want me to come on vacation with them", "choice1":"Have a great break!", "choice2":"No way, I'll take you somewhere!"},
	{"name":"Pet", "type":"generic", "description":"I want a pet!", "choice1":"That'll be so cute!", "choice2":"That'll be so much work!"},
	{"name":"SephirothLove", "type":"personal", "description":"Do you still love me?", "choice1":"Your mommy issues are too much", "choice2":"Let's merge with the lifestream...together!"},
	{"name":"Wedding+1", "type":"generic", "description":"Will you be my +1 to my cousin's wedding?", "choice1":"That sounds wonderful!", "choice2":"That sounds like a living hell!"},
	{"name":"Parents", "type":"generic", "description":"My parents want to meet you", "choice1":"Let's go to dinner", "choice2":"Let's go do karaoke"},
	{"name":"RobinHood", "type":"generic", "description":"I just stole Elon Musk's bitcoin wallet", "choice1":"Let's redistribute that wealth, comrade!", "choice2":"Hello, officer? Yes, this one right here!"},
	{"name":"Gambling", "type":"generic", "description":"I've started playing high stakes poker and I feel like I have to keep chasing those wins", "choice1":"All in! I'll start shopping for five star hotel breaks!", "choice2":"Maybe you should ease off if it stops being fun"}
]



#Function for transferring CSV to Available Events
func load_csv_as_array(csv_path : String, ) -> Array:
	
	#Store Results
	var _array : Array = []
	
	#Load file with READ access
	var file = FileAccess.open(csv_path, FileAccess.READ)
	
	#Abort if no File Loaded
	if !file:
		push_error("No CSV Found:", csv_path)
		return _array
	
	#Iterate over each line of csv and append it
	#TODO: Format each line's data into an array of resources
	while not file.eof_reached():
		var line = file.get_line()
		_array.append(line.split(",")) 
	
	#Close file after read function is complete
	file.close()
	
	return _array
