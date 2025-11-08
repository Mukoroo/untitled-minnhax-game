extends Resource
class_name Event

enum EventType {Generic, Personal}

@export var name : String
@export var type : EventType
@export var description : String

@export var choice_1_text : String
@export var choice_1_passion_effect : int
@export var choice_1_emotion_effect : int
@export var choice_1_spectacle_effect : int
@export var choice_1_drama_effect : int

@export var choice_2_text : String
@export var choice_2_passion_effect : int
@export var choice_2_emotion_effect : int
@export var choice_2_spectacle_effect : int
@export var choice_2_drama_effect : int
