extends "res://scripts/playerScripts/stateMachine/StateMachine.gd"


onready var idle = $idle
onready var move = $move
onready var jump = $jump
onready var attack = $attack


func _ready():
	states_map = {
		"idle": idle,
		"move":move,
		"jump":jump,
		"attack":attack
	}


func _change_state(stateName):
	if stateName in ["attack","jump"]	:
		states_stack.push_front(states_map[stateName])
	if stateName=="jump" and currentState ==move:
		jump.initialize(move.horizontalVelocity,move.jumpvelocity)
	._change_state(stateName)

