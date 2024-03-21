extends "res://scripts/playerScripts/stateMachine/states/state.gd"
# Collection of important methods to handle direction and animation.

export var jumpHeight:float = 32
export var timeToPeak:float =0.2
var jumpvelocity:Vector2 = Vector2(0.0,-(2.0*jumpHeight)/timeToPeak)
var gravity:Vector2 = Vector2(0.0,(2.0*jumpHeight)/pow(timeToPeak,2))
var startjump = false
var initializedJump =false


func handle_input(_event):
	pass

func get_input_direction():
	var input_direction = Vector2(
			Input.get_action_strength("right") - Input.get_action_strength("left"),
			-1 if Input.is_action_just_pressed("jump") else 0
	)
	return input_direction


func update_look_direction(direction):
	if direction and owner.look_direction != direction:
		owner.look_direction = direction
