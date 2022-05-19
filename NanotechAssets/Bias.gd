extends Node2D

signal driveTriggered(signalName, driveNumber, signalStrength, whoSentIt)

# Declare member variables here. Examples:
export var bias = 0.500000
export var driveNumber = 0
onready var showTrue
onready var showFalse
var DriveName = "SignalName"
# var b = "text"

func trigger(ag, ar, eg, entity):
	if(ag>=bias||ar>=bias||eg>=bias):
		showFalse.visible = false
		showTrue.visible = true
		emit_signal(DriveName, driveNumber, bias, entity)

# Called when the node enters the scene tree for the first time.
func _ready():
	showTrue = get_node("True")
	showFalse = get_node("False")
	if(driveNumber == 0):
		DriveName = "Explore"
	elif(driveNumber == 1):
		DriveName = "Fame"
	elif(driveNumber == 2):
		DriveName = "Fun"
	elif(driveNumber == 3):
		DriveName = "Fury"
	elif(driveNumber == 4):
		DriveName = "Jealousy"
	elif(driveNumber == 5):
		DriveName = "Justice"
	elif(driveNumber == 6):
		DriveName = "Love"
	elif(driveNumber == 7):
		DriveName = "Lust"
	elif(driveNumber == 8):
		DriveName = "Malice"
	elif(driveNumber == 9):
		DriveName = "Plunder"
	elif(driveNumber == 10):
		DriveName = "Pride"
	elif(driveNumber == 11):
		DriveName = "Respect"
	elif(driveNumber == 12):
		DriveName = "Revenge"
	elif(driveNumber == 13):
		DriveName = "Solution"
	elif(driveNumber == 14):
		DriveName = "Status"
	elif(driveNumber == 15):
		DriveName = "Victory"
	elif(driveNumber == 16):
		DriveName = "Wealth"
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
