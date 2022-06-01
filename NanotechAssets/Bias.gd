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
	if(driveNumber == 1):
		DriveName = "Fame"
	if(driveNumber == 2):
		DriveName = "Fun"
	if(driveNumber == 3):
		DriveName = "Fury"
	if(driveNumber == 4):
		DriveName = "Jealousy"
	if(driveNumber == 5):
		DriveName = "Justice"
	if(driveNumber == 6):
		DriveName = "Love"
	if(driveNumber == 7):
		DriveName = "Lust"
	if(driveNumber == 8):
		DriveName = "Malice"
	if(driveNumber == 9):
		DriveName = "Plunder"
	if(driveNumber == 10):
		DriveName = "Pride"
	if(driveNumber == 11):
		DriveName = "Respect"
	if(driveNumber == 12):
		DriveName = "Revenge"
	if(driveNumber == 13):
		DriveName = "Solution"
	if(driveNumber == 14):
		DriveName = "Status"
	if(driveNumber == 15):
		DriveName = "Victory"
	if(driveNumber == 16):
		DriveName = "Wealth"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
