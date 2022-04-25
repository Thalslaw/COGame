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

onready var AgQuotient = $AgQuotient
onready var AgQuotientSprite = $AgQuotient/Sprite
onready var ArQuotient = $ArQuotient
onready var ArQuotientSprite = $ArQuotient/Sprite
onready var EgQuotient = $EgQuotient
onready var EgQuotientSprite = $EgQuotient/Sprite

onready var ExploreBias = $ExploreBias
onready var ExploreBiasTrue = $ExploreBias/True
onready var ExploreBiasFalse = $ExploreBias/False
onready var FameBias = $FameBias
onready var FameBiasTrue = $FameBias/True
onready var FameBiasFalse = $FameBias/False
onready var FunBias = $FunBias
onready var FunBiasTrue = $FunBias/True
onready var FunBiasFalse = $FunBias/False
onready var FuryBias = $FuryBias
onready var FuryBiasTrue = $FuryBias/True
onready var FuryBiasFalse = $FuryBias/False
onready var JealousyBias = $JealousyBias
onready var JealousyBiasTrue = $JealousyBias/True
onready var JealousyBiasFalse = $JealousyBias/False
onready var JusticeBias = $JusticeBias
onready var JusticeBiasTrue = $JusticeBias/True
onready var JusticeBiasFalse = $JusticeBias/False
onready var LoveBias = $LoveBias
onready var LoveBiasTrue = $LoveBias/True
onready var LoveBiasFalse = $LoveBias/False
onready var LustBias = $LustBias
onready var LustBiasTrue = $LustBias/True
onready var LustBiasFalse = $LustBias/False
onready var MaliceBias = $MaliceBias
onready var MaliceBiasTrue = $MaliceBias/True
onready var MaliceBiasFalse = $MaliceBias/False
onready var PlunderBias = $PlunderBias
onready var PlunderBiasTrue = $PlunderBias/True
onready var PlunderBiasFalse = $PlunderBias/False
onready var PrideBias = $PrideBias
onready var PrideBiasTrue = $PrideBias/True
onready var PrideBiasFalse = $PrideBias/False
onready var RespectBias = $RespectBias
onready var RespectBiasTrue = $RespectBias/True
onready var RespectBiasFalse = $RespectBias/False
onready var RevengeBias = $RevengeBias
onready var RevengeBiasTrue = $RevengeBias/True
onready var RevengeBiasFalse = $RevengeBias/False
onready var SolutionBias = $SolutionBias
onready var SolutionBiasTrue = $SolutionBias/True
onready var SolutionBiasFalse = $SolutionBias/False
onready var StatusBias = $StatusBias
onready var StatusBiasTrue = $StatusBias/True
onready var StatusBiasFalse = $StatusBias/False
onready var VictoryBias = $VictoryBias
onready var VictoryBiasTrue = $VictoryBias/True
onready var VictoryBiasFalse = $VictoryBias/False
onready var WealthBias = $WealthBias
onready var WealthBiasTrue = $WealthBias/True
onready var WealthBiasFalse = $WealthBias/False

func Explore(isAPlayer):
	ExploreBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1))
	if(isAPlayer):
		ExploreTriggeredFalse.visible = false
		ExploreTriggeredTrue.visible = true

func Fame(isAPlayer):
	FameBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0))
	if(isAPlayer):
		FameTriggeredFalse.visible = false
		FameTriggeredTrue.visible = true

func Fun(isAPlayer):
	FunBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1))
	if(isAPlayer):
		FunTriggeredFalse.visible = false
		FunTriggeredTrue.visible = true

func Fury(isAPlayer):
	FuryBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0))
	if(isAPlayer):
		FuryTriggeredFalse.visible = false
		FuryTriggeredTrue.visible = true

func Jealousy(isAPlayer):
	JealousyBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0))
	if(isAPlayer):
		JealousyTriggeredFalse.visible = false
		JealousyTriggeredTrue.visible = true

func Justice(isAPlayer):
	JusticeBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0))
	if(isAPlayer):
		JusticeTriggeredFalse.visible = false
		JusticeTriggeredTrue.visible = true

func Love(isAPlayer):
	LoveBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0))
	if(isAPlayer):
		LoveTriggeredFalse.visible = false
		LoveTriggeredTrue.visible = true

func Lust(isAPlayer):
	LustBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1))
	if(isAPlayer):
		LustTriggeredFalse.visible = false
		LustTriggeredTrue.visible = true

func Malice(isAPlayer):
	MaliceBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1))
	if(isAPlayer):
		MaliceTriggeredFalse.visible = false
		MaliceTriggeredTrue.visible = true

func Plunder(isAPlayer):
	PlunderBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1))
	if(isAPlayer):
		PlunderTriggeredFalse.visible = false
		PlunderTriggeredTrue.visible = true

func Pride(isAPlayer):
	PrideBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0))
	if(isAPlayer):
		PrideTriggeredFalse.visible = false
		PrideTriggeredTrue.visible = true

func Respect(isAPlayer):
	RespectBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0))
	if(isAPlayer):
		RespectTriggeredFalse.visible = false
		RespectTriggeredTrue.visible = true

func Revenge(isAPlayer):
	RevengeBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0))
	if(isAPlayer):
		RevengeTriggeredFalse.visible = false
		RevengeTriggeredTrue.visible = true

func Solution(isAPlayer):
	SolutionBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0))
	if(isAPlayer):
		SolutionTriggeredFalse.visible = false
		SolutionTriggeredTrue.visible = true

func Status(isAPlayer):
	StatusBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0))
	if(isAPlayer):
		StatusTriggeredFalse.visible = false
		StatusTriggeredTrue.visible = true

func Victory(isAPlayer):
	VictoryBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1))
	if(isAPlayer):
		VictoryTriggeredFalse.visible = false
		VictoryTriggeredTrue.visible = true

func Wealth(isAPlayer):
	WealthBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0))
	if(isAPlayer):
		WealthTriggeredFalse.visible = false
		WealthTriggeredTrue.visible = true

func decl(isAPlayer):
	if(isAPlayer):
		ExploreTriggeredFalse.visible = true
		FameTriggeredFalse.visible = true
		FunTriggeredFalse.visible = true
		FuryTriggeredFalse.visible = true
		JealousyTriggeredFalse.visible = true
		JusticeTriggeredFalse.visible = true
		LoveTriggeredFalse.visible = true
		LustTriggeredFalse.visible = true
		MaliceTriggeredFalse.visible = true
		PlunderTriggeredFalse.visible = true
		PrideTriggeredFalse.visible = true
		RespectTriggeredFalse.visible = true
		RevengeTriggeredFalse.visible = true
		SolutionTriggeredFalse.visible = true
		StatusTriggeredFalse.visible = true
		VictoryTriggeredFalse.visible = true
		WealthTriggeredFalse.visible = true
		AgQuotientSprite.visible = true
		ArQuotientSprite.visible = true
		EgQuotientSprite.visible = true



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
