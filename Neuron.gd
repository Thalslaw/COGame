extends Node2D

##needs a const for its dendrite count
##needs a list of dendrites
##needs to make dendrites on creation

# needs a value for its bias 
export var max_bias = 1.0 setget set_max_bias
var bias = max_bias setget set_bias

signal bias_modified(value)
signal MAX_bias_modified(value)

func set_max_bias(value):
	max_bias = value
	self.max_bias = min(bias, max_bias)
	emit_signal("MAX_bias_modified", max_bias)

func set_bias(value):
	bias = value
	emit_signal("bias_modified", bias)


# needs a value for its delta 
export var max_delta = 1.0 setget set_max_delta
var delta = max_delta setget set_delta

signal delta_modified(value)
signal MAX_delta_modified(value)

func set_max_delta(value):
	max_delta = value
	self.max_delta = min(delta, max_delta)
	emit_signal("MAX_delta_modified", max_delta)

func set_delta(value):
	delta = value
	emit_signal("delta_modified", delta)

# needs a value for its output value
export var max_output = 1.0 setget set_max_output
var output = max_output setget set_output

signal output_modified(value)
signal MAX_output_modified(value)

func set_max_output(value):
	max_output = value
	self.max_output = min(output, max_output)
	emit_signal("MAX_output_modified", max_output)

func set_output(value):
	output = value
	emit_signal("output_modified", output)

# Called when the node enters the scene tree for the first time.
func _ready():
	#randomise its bias value
	bias = randf()

