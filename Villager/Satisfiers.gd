extends Node
class_name Satisfiers

export var max_agentic_satisfaction = 1.0 setget set_max_agentic_satisfaction
var agentic_satisfaction = max_agentic_satisfaction setget set_agentic_satisfaction

export var max_arousal_satisfaction = 1.0 setget set_max_arousal_satisfaction
var arousal_satisfaction = max_arousal_satisfaction setget set_arousal_satisfaction

export var max_egoic_satisfaction = 1.0 setget set_max_egoic_satisfaction
var egoic_satisfaction = max_egoic_satisfaction setget set_egoic_satisfaction



signal MAX_AGsat_modified(value)
signal MAX_ARsat_modified(value)
signal MAX_EGsat_modified(value)

signal AGsat_modified(value)
signal ARsat_modified(value)
signal EGsat_modified(value)

func set_max_agentic_satisfaction(value):
	max_agentic_satisfaction = value
	self.agentic_satisfaction = min(agentic_satisfaction, max_agentic_satisfaction)
	emit_signal("MAX_AGsat_modified", max_agentic_satisfaction)
	
func set_max_arousal_satisfaction(value):
	max_arousal_satisfaction = value
	self.arousal_satisfaction = min(arousal_satisfaction, max_arousal_satisfaction)
	emit_signal("MAX_ARsat_modified", max_arousal_satisfaction)
	
func set_max_egoic_satisfaction(value):
	max_egoic_satisfaction = value
	self.egoic_satisfaction = min(egoic_satisfaction, max_egoic_satisfaction)
	emit_signal("MAX_EGsat_modified", max_egoic_satisfaction)

func set_agentic_satisfaction(value):
	agentic_satisfaction = value
	emit_signal("AGsat_modified", agentic_satisfaction)

func set_arousal_satisfaction(value):
	arousal_satisfaction = value
	emit_signal("ARsat_modified", arousal_satisfaction)
	
func set_egoic_satisfaction(value):
	egoic_satisfaction = value
	emit_signal("EGsat_modified",egoic_satisfaction)

func _init():
	#these are set to 50% so that the agent always initialises with things it 'could' want to do.
	self.agentic_satisfaction = (max_agentic_satisfaction/2)
	self.arousal_satisfaction = (max_arousal_satisfaction/2)
	self.egoic_satisfaction = (max_egoic_satisfaction/2)
	
func getAg():
	return agentic_satisfaction
	
func getAr():
	return arousal_satisfaction
	
func getEg():
	#here, have an eg. :P 
	return egoic_satisfaction
	
func depress(value):
	#drop in satisfaction over time.
	agentic_satisfaction = agentic_satisfaction - value
	arousal_satisfaction = arousal_satisfaction - value
	egoic_satisfaction = egoic_satisfaction - value
