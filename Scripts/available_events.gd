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
