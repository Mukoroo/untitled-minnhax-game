extends Node2D

var picked_event : Event

# 1,2,3,4 = Passion, Emotion, Spectacle, Drama
var current_passion : int = 50
var current_emotion : int = 50
var current_spectacle : int = 50
var current_drama : int = 50

##########################################
##Functions for Adding effects to Passion!
func add_to_passion(amt : int):
	current_passion += amt

func add_to_emotion(amt : int):
	current_emotion += amt

func add_to_spectacle(amt : int):
	current_spectacle += amt

func add_to_drama(amt : int):
	current_drama += amt

#Function for when Player Chooses Choice 1
#Adds effects for each Metric based on Choice
func player_chose_choice_1():
	add_to_passion(picked_event.choice_1_passion_effect)
	add_to_emotion(picked_event.choice_1_emotion_effect)
	add_to_spectacle(picked_event.choice_1_spectacle_effect)
	add_to_drama(picked_event.choice_1_drama_effect)

#Function for when Player Chooses Choice 2
func player_chose_choice_2():
	add_to_passion(picked_event.choice_2_passion_effect)
	add_to_emotion(picked_event.choice_2_emotion_effect)
	add_to_spectacle(picked_event.choice_2_spectacle_effect)
	add_to_drama(picked_event.choice_2_drama_effect)
