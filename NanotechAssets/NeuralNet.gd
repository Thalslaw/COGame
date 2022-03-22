extends Node2D

# visual display
onready var ExploreTriggered = $ExploreTriggered
onready var ExploreTriggeredTrue = $ExploreTriggered/True
onready var ExploreTriggeredFalse = $ExploreTriggered/False
onready var FameTriggered = $FameTriggered
onready var FameTriggeredTrue = $FameTriggered/True
onready var FameTriggeredFalse = $FameTriggered/False
onready var FunTriggered = $FunTriggered
onready var FunTriggeredTrue = $FunTriggered/True
onready var FunTriggeredFalse = $FunTriggered/False
onready var FuryTriggered = $FuryTriggered
onready var FuryTriggeredTrue = $FuryTriggered/True
onready var FuryTriggeredFalse = $FuryTriggered/False
onready var JealousyTriggered = $JealousyTriggered
onready var JealousyTriggeredTrue = $JealousyTriggered/True
onready var JealousyTriggeredFalse = $JealousyTriggered/False
onready var JusticeTriggered = $JusticeTriggered
onready var JusticeTriggeredTrue = $JusticeTriggered/True
onready var JusticeTriggeredFalse = $JusticeTriggered/False
onready var LoveTriggered = $LoveTriggered
onready var LoveTriggeredTrue = $LoveTriggered/True
onready var LoveTriggeredFalse = $LoveTriggered/False
onready var LustTriggered = $LustTriggered
onready var LustTriggeredTrue = $LustTriggered/True
onready var LustTriggeredFalse = $LustTriggered/False
onready var MaliceTriggered = $MaliceTriggered
onready var MaliceTriggeredTrue = $MaliceTriggered/True
onready var MaliceTriggeredFalse = $MaliceTriggered/False
onready var PlunderTriggered = $PlunderTriggered
onready var PlunderTriggeredTrue = $PlunderTriggered/True
onready var PlunderTriggeredFalse = $PlunderTriggered/False
onready var PrideTriggered = $PrideTriggered
onready var PrideTriggeredTrue = $PrideTriggered/True
onready var PrideTriggeredFalse = $PrideTriggered/False
onready var RespectTriggered = $RespectTriggered
onready var RespectTriggeredTrue = $RespectTriggered/True
onready var RespectTriggeredFalse = $RespectTriggered/False
onready var RevengeTriggered = $RevengeTriggered
onready var RevengeTriggeredTrue = $RevengeTriggered/True
onready var RevengeTriggeredFalse = $RevengeTriggered/False
onready var SolutionTriggered = $SolutionTriggered
onready var SolutionTriggeredTrue = $SolutionTriggered/True
onready var SolutionTriggeredFalse = $SolutionTriggered/False
onready var StatusTriggered = $StatusTriggered
onready var StatusTriggeredTrue = $StatusTriggered/True
onready var StatusTriggeredFalse = $StatusTriggered/False
onready var VictoryTriggered = $VictoryTriggered
onready var VictoryTriggeredTrue = $VictoryTriggered/True
onready var VictoryTriggeredFalse = $VictoryTriggered/False
onready var WealthTriggered = $WealthTriggered
onready var WealthTriggeredTrue = $WealthTriggered/True
onready var WealthTriggeredFalse = $WealthTriggered/False

func Explore(isAPlayer):
	if(isAPlayer):
		ExploreTriggeredFalse.visible = false
		ExploreTriggeredTrue.visible = true

func Fame(isAPlayer):
	if(isAPlayer):
		FameTriggeredFalse.visible = false
		FameTriggeredTrue.visible = true

func Fun(isAPlayer):
	if(isAPlayer):
		FunTriggeredFalse.visible = false
		FunTriggeredTrue.visible = true

func Fury(isAPlayer):
	if(isAPlayer):
		FuryTriggeredFalse.visible = false
		FuryTriggeredTrue.visible = true

func Jealousy(isAPlayer):
	if(isAPlayer):
		JealousyTriggeredFalse.visible = false
		JealousyTriggeredTrue.visible = true

func Justice(isAPlayer):
	if(isAPlayer):
		JusticeTriggeredFalse.visible = false
		JusticeTriggeredTrue.visible = true

func Love(isAPlayer):
	if(isAPlayer):
		LoveTriggeredFalse.visible = false
		LoveTriggeredTrue.visible = true

func Lust(isAPlayer):
	if(isAPlayer):
		LustTriggeredFalse.visible = false
		LustTriggeredTrue.visible = true

func Malice(isAPlayer):
	if(isAPlayer):
		MaliceTriggeredFalse.visible = false
		MaliceTriggeredTrue.visible = true

func Plunder(isAPlayer):
	if(isAPlayer):
		PlunderTriggeredFalse.visible = false
		PlunderTriggeredTrue.visible = true

func Pride(isAPlayer):
	if(isAPlayer):
		PrideTriggeredFalse.visible = false
		PrideTriggeredTrue.visible = true

func Respect(isAPlayer):
	if(isAPlayer):
		RespectTriggeredFalse.visible = false
		RespectTriggeredTrue.visible = true

func Revenge(isAPlayer):
	if(isAPlayer):
		RevengeTriggeredFalse.visible = false
		RevengeTriggeredTrue.visible = true

func Solution(isAPlayer):
	if(isAPlayer):
		SolutionTriggeredFalse.visible = false
		SolutionTriggeredTrue.visible = true

func Status(isAPlayer):
	if(isAPlayer):
		StatusTriggeredFalse.visible = false
		StatusTriggeredTrue.visible = true

func Victory(isAPlayer):
	if(isAPlayer):
		VictoryTriggeredFalse.visible = false
		VictoryTriggeredTrue.visible = true

func Wealth(isAPlayer):
	if(isAPlayer):
		WealthTriggeredFalse.visible = false
		WealthTriggeredTrue.visible = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
