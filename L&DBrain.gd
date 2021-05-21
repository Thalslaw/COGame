extends Node2D

#Find Satisfiers.GD and make sure that they exist for this entity

#enumerate drives and their corresponding satisfiers lists
enum {null, exploration, fame, fun, fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth}
var agencers = [1,3,6,8,9,10,11,12,14,15,16,17]
var arousers = [1,2,3,4,5,7,8,9,10,13,16]
var egoers = [2,4,5,6,7,11,12,13,14,15,17]

#get base agentic satisfaction

#get base arousal satisfaction

#get base egoic satisfaction

func _ready():
	pass
