extends Node2D

# signals
signal emotionalState(ag,ar,eg)

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

onready var HiddenLayers = $HiddenLayers

onready var ExploreWant = $ExploreWant
onready var ExploreWantTrue = $ExploreWant/True
onready var ExploreWantFalse = $ExploreWant/False
onready var FameWant = $FameWant
onready var FameWantTrue = $FameWant/True
onready var FameWantFalse = $FameWant/False
onready var FunWant = $FunWant
onready var FunWantTrue = $FunWant/True
onready var FunWantFalse = $FunWant/False
onready var FuryWant = $FuryWant
onready var FuryWantTrue = $FuryWant/True
onready var FuryWantFalse = $FuryWant/False
onready var JealousyWant = $JealousyWant
onready var JealousyWantTrue = $JealousyWant/True
onready var JealousyWantFalse = $JealousyWant/False
onready var JusticeWant = $JusticeWant
onready var JusticeWantTrue = $JusticeWant/True
onready var JusticeWantFalse = $JusticeWant/False
onready var LoveWant = $LoveWant
onready var LoveWantTrue = $LoveWant/True
onready var LoveWantFalse = $LoveWant/False
onready var LustWant = $LustWant
onready var LustWantTrue = $LustWant/True
onready var LustWantFalse = $LustWant/False
onready var MaliceWant = $MaliceWant
onready var MaliceWantTrue = $MaliceWant/True
onready var MaliceWantFalse = $MaliceWant/False
onready var PlunderWant = $PlunderWant
onready var PlunderWantTrue = $PlunderWant/True
onready var PlunderWantFalse = $PlunderWant/False
onready var PrideWant = $PrideWant
onready var PrideWantTrue = $PrideWant/True
onready var PrideWantFalse = $PrideWant/False
onready var RespectWant = $RespectWant
onready var RespectWantTrue = $RespectWant/True
onready var RespectWantFalse = $RespectWant/False
onready var RevengeWant = $RevengeWant
onready var RevengeWantTrue = $RevengeWant/True
onready var RevengeWantFalse = $RevengeWant/False
onready var SolutionWant = $SolutionWant
onready var SolutionWantTrue = $SolutionWant/True
onready var SolutionWantFalse = $SolutionWant/False
onready var StatusWant = $StatusWant
onready var StatusWantTrue = $StatusWant/True
onready var StatusWantFalse = $StatusWant/False
onready var VictoryWant = $VictoryWant
onready var VictoryWantTrue = $VictoryWant/True
onready var VictoryWantFalse = $VictoryWant/False
onready var WealthWant = $WealthWant
onready var WealthWantTrue = $WealthWant/True
onready var WealthWantFalse = $WealthWant/False

#personal state
onready var Vulnerable = $Vulnerability
onready var VulnerableTrue = $Vulnerability/True
onready var VulnerableFalse = $Vulnerability/False

#Capability to satisfy drives from environment
onready var ExploreAble = $ExploreAble
onready var ExploreAbleTrue = $ExploreAble/True
onready var ExploreAbleFalse = $ExploreAble/False
onready var FameAble = $FameAble
onready var FameAbleTrue = $FameAble/True
onready var FameAbleFalse = $FameAble/False
onready var FunAble = $FunAble
onready var FunAbleTrue = $FunAble/True
onready var FunAbleFalse = $FunAble/False
onready var FuryAble = $FuryAble
onready var FuryAbleTrue = $FuryAble/True
onready var FuryAbleFalse = $FuryAble/False
onready var JealousyAble = $JealousyAble
onready var JealousyAbleTrue = $JealousyAble/True
onready var JealousyAbleFalse = $JealousyAble/False
onready var JusticeAble = $JusticeAble
onready var JusticeAbleTrue = $JusticeAble/True
onready var JusticeAbleFalse = $JusticeAble/False
onready var LoveAble = $LoveAble
onready var LoveAbleTrue = $LoveAble/True
onready var LoveAbleFalse = $LoveAble/False
onready var LustAble = $LustAble
onready var LustAbleTrue = $LustAble/True
onready var LustAbleFalse = $LustAble/False
onready var MaliceAble = $MaliceAble
onready var MaliceAbleTrue = $MaliceAble/True
onready var MaliceAbleFalse = $MaliceAble/False
onready var PlunderAble = $PlunderAble
onready var PlunderAbleTrue = $PlunderAble/True
onready var PlunderAbleFalse = $PlunderAble/False
onready var PrideAble = $PrideAble
onready var PrideAbleTrue = $PrideAble/True
onready var PrideAbleFalse = $PrideAble/False
onready var RespectAble = $RespectAble
onready var RespectAbleTrue = $RespectAble/True
onready var RespectAbleFalse = $RespectAble/False
onready var RevengeAble = $RevengeAble
onready var RevengeAbleTrue = $RevengeAble/True
onready var RevengeAbleFalse = $RevengeAble/False
onready var SolutionAble = $SolutionAble
onready var SolutionAbleTrue = $SolutionAble/True
onready var SolutionAbleFalse = $SolutionAble/False
onready var StatusAble = $StatusAble
onready var StatusAbleTrue = $StatusAble/True
onready var StatusAbleFalse = $StatusAble/False
onready var VictoryAble = $VictoryAble
onready var VictoryAbleTrue = $VictoryAble/True
onready var VictoryAbleFalse = $VictoryAble/False
onready var WealthAble = $WealthAble
onready var WealthAbleTrue = $WealthAble/True
onready var WealthAbleFalse = $WealthAble/False

#memories
var LeverageList = []


func Explore(isAPlayer):
	if(isAPlayer):
		ExploreBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1), get_parent())
		ExploreTriggeredFalse.visible = false
		ExploreTriggeredTrue.visible = true

func Fame(isAPlayer):
	if(isAPlayer):
		FameBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0), get_parent())
		FameTriggeredFalse.visible = false
		FameTriggeredTrue.visible = true

func Fun(isAPlayer):
	if(isAPlayer):
		FunBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1), get_parent())
		FunTriggeredFalse.visible = false
		FunTriggeredTrue.visible = true

func Fury(isAPlayer):
	if(isAPlayer):
		FuryBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0), get_parent())
		FuryTriggeredFalse.visible = false
		FuryTriggeredTrue.visible = true

func Jealousy(isAPlayer):
	if(isAPlayer):
		JealousyBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0), get_parent())
		JealousyTriggeredFalse.visible = false
		JealousyTriggeredTrue.visible = true

func Justice(isAPlayer):
	if(isAPlayer):
		JusticeBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0), get_parent())
		JusticeTriggeredFalse.visible = false
		JusticeTriggeredTrue.visible = true

func Love(isAPlayer):
	if(isAPlayer):
		LoveBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0), get_parent())
		LoveTriggeredFalse.visible = false
		LoveTriggeredTrue.visible = true

func Lust(isAPlayer):
	if(isAPlayer):
		LustBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1), get_parent())
		LustTriggeredFalse.visible = false
		LustTriggeredTrue.visible = true

func Malice(isAPlayer):
	if(isAPlayer):
		MaliceBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1), get_parent())
		MaliceTriggeredFalse.visible = false
		MaliceTriggeredTrue.visible = true

func Plunder(isAPlayer):
	if(isAPlayer):
		PlunderBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1), get_parent())
		PlunderTriggeredFalse.visible = false
		PlunderTriggeredTrue.visible = true

func Pride(isAPlayer):
	if(isAPlayer):
		PrideBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0), get_parent())
		PrideTriggeredFalse.visible = false
		PrideTriggeredTrue.visible = true

func Respect(isAPlayer):
	if(isAPlayer):
		RespectBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0), get_parent())
		RespectTriggeredFalse.visible = false
		RespectTriggeredTrue.visible = true

func Revenge(isAPlayer):
	if(isAPlayer):
		RevengeBias.trigger((AgQuotient.Quotient*1), (ArQuotient.Quotient*0), (EgQuotient.Quotient*0), get_parent())
		RevengeTriggeredFalse.visible = false
		RevengeTriggeredTrue.visible = true

func Solution(isAPlayer):
	if(isAPlayer):
		SolutionBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0), get_parent())
		SolutionTriggeredFalse.visible = false
		SolutionTriggeredTrue.visible = true

func Status(isAPlayer):
	if(isAPlayer):
		StatusBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0), get_parent())
		StatusTriggeredFalse.visible = false
		StatusTriggeredTrue.visible = true

func Victory(isAPlayer):
	if(isAPlayer):
		VictoryBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*0), (EgQuotient.Quotient*1), get_parent())
		VictoryTriggeredFalse.visible = false
		VictoryTriggeredTrue.visible = true

func Wealth(isAPlayer):
	if(isAPlayer):
		WealthBias.trigger((AgQuotient.Quotient*0), (ArQuotient.Quotient*1), (EgQuotient.Quotient*0), get_parent())
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
	#change the colour of the entity over time as the agency, arousal and ego change
	emit_signal("emotionalState",(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	

func _on_ExploreBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_FameBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_FunBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_FuryBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_JealousyBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_JusticeBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_LoveBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_LustBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_MaliceBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_PlunderBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_PrideBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_RespectBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_RevengeBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_SolutionBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_StatusBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_VictoryBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)

func _on_WealthBias_driveTriggered(value, amount, entity):
	HiddenLayers.ISignal((value),(AgQuotient.Quotient), (ArQuotient.Quotient), (EgQuotient.Quotient))
	#remember the amount of satisfaction gained from the other person's interactions.
	var memory = [amount, entity]
	LeverageList.append(memory)


func _on_HiddenLayers_output(want, yn):
	if want == 1:
		if yn == true:
			ExploreWantTrue.visible = true
			ExploreWantFalse.visible = false
		else:
			ExploreWantTrue.visible = false
			ExploreWantFalse.visible = true
	if want == 2:
		if yn == true:
			FameWantTrue.visible = true
			FameWantFalse.visible = false
		else:
			FameWantTrue.visible = false
			FameWantFalse.visible = true
	if want == 3:
		if yn == true:
			FunWantTrue.visible = true
			FunWantFalse.visible = false
		else:
			FunWantTrue.visible = false
			FunWantFalse.visible = true
	if want == 4:
		if yn == true:
			FuryWantTrue.visible = true
			FuryWantFalse.visible = false
		else:
			FuryWantTrue.visible = false
			FuryWantFalse.visible = true
	if want == 5:
		if yn == true:
			JealousyWantTrue.visible = true
			JealousyWantFalse.visible = false
		else:
			JealousyWantTrue.visible = false
			JealousyWantFalse.visible = true
	if want == 6:
		if yn == true:
			JusticeWantTrue.visible = true
			JusticeWantFalse.visible = false
		else:
			JusticeWantTrue.visible = false
			JusticeWantFalse.visible = true
	if want == 7:
		if yn == true:
			LoveWantTrue.visible = true
			LoveWantFalse.visible = false
		else:
			LoveWantTrue.visible = false
			LoveWantFalse.visible = true
	if want == 8:
		if yn == true:
			LustWantTrue.visible = true
			LustWantFalse.visible = false
		else:
			LustWantTrue.visible = false
			LustWantFalse.visible = true
	if want == 9:
		if yn == true:
			MaliceWantTrue.visible = true
			MaliceWantFalse.visible = false
		else:
			MaliceWantTrue.visible = false
			MaliceWantFalse.visible = true
	if want == 10:
		if yn == true:
			PlunderWantTrue.visible = true
			PlunderWantFalse.visible = false
		else:
			PlunderWantTrue.visible = false
			PlunderWantFalse.visible = true
	if want == 11:
		if yn == true:
			PrideWantTrue.visible = true
			PrideWantFalse.visible = false
		else:
			PrideWantTrue.visible = false
			PrideWantFalse.visible = true
	if want == 12:
		if yn == true:
			RespectWantTrue.visible = true
			RespectWantFalse.visible = false
		else:
			RespectWantTrue.visible = false
			RespectWantFalse.visible = true
	if want == 13:
		if yn == true:
			RevengeWantTrue.visible = true
			RevengeWantFalse.visible = false
		else:
			RevengeWantTrue.visible = false
			RevengeWantFalse.visible = true
	if want == 14:
		if yn == true:
			SolutionWantTrue.visible = true
			SolutionWantFalse.visible = false
		else:
			SolutionWantTrue.visible = false
			SolutionWantFalse.visible = true
	if want == 15:
		if yn == true:
			StatusWantTrue.visible = true
			StatusWantFalse.visible = false
		else:
			StatusWantTrue.visible = false
			StatusWantFalse.visible = true
	if want == 16:
		if yn == true:
			VictoryWantTrue.visible = true
			VictoryWantFalse.visible = false
		else:
			VictoryWantTrue.visible = false
			VictoryWantFalse.visible = true
	if want == 17:
		if yn == true:
			WealthWantTrue.visible = true
			WealthWantFalse.visible = false
		else:
			WealthWantTrue.visible = false
			WealthWantFalse.visible = true
	
	
