extends Node2D

#Concept: to be able to satisfy this drive whenever the entity has travelled and experiences some form of danger.
#Refinements: the danger can be identified as 'loneliness' or 'isolation'. When the entity is not surrounded by other entities it means it is exploring.

# store the number of entities in view.
# store a toggle showing whether the drive has been triggered.

onready var AbleTrue = $True
onready var AbleFalse = $False

#numberOfEntitiesDrivenFunctionCalled():
#	if number of entities in view is zero
#		start timer
#	if number of entities in view is zero and timer has cycled
#		toggle triggered to true
#		let the entity know it satisfied its explore drive
#	if number of entities in view changes from zero to one
#		toggle triggered to false
#		if timer is cycling or has cycled
#			stop timer
