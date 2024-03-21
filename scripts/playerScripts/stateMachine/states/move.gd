#extends "res://scripts/playerScripts/stateMachine/states/state.gd"
extends "res://scripts/playerScripts/motion/onGround/onGround.gd"

export var runningJumpHeight:float = 20.0
export var jumpingDistance:float = 20.0







var startedMoving = false
func enter():
	startedMoving = false
	var jumpvelocity:Vector2 = Vector2(0.0,-(2.0*runningJumpHeight)/timeToPeak)
	var horizontalVelocity:Vector2 = Vector2(-((jumpvelocity*jumpingDistance/2)/(2*runningJumpHeight)).y,0.0)
	owner.get_node("AnimationPlayer").play("walk")

func calculate_horizontal_velocity(dir):
	gravity = Vector2(0.0,(2.0*runningJumpHeight)/pow(timeToPeak,2))
	jumpvelocity = Vector2(0.0,-(2.0*runningJumpHeight)/timeToPeak)
	if dir=="right":
		return Vector2(-((jumpvelocity*jumpingDistance)/(2*runningJumpHeight)).y,0)
	if dir == "left":
		return Vector2(((jumpvelocity*jumpingDistance)/(2*runningJumpHeight)).y,0)
	else:
		return Vector2.ZERO
func exit():
	startedMoving = false
	

func get_input() -> Dictionary:
	return {
		"rightJustPressed":Input.is_action_just_pressed("right") == true,
		"leftJustPressed":Input.is_action_just_pressed("left") == true,
		"right": Input.is_action_pressed("right") == true,
		"left":Input.is_action_pressed("left") == true,
		"jump":Input.is_action_just_pressed("jump") == true,
	}
#func _unhandled_key_input(event):

func update_display():
	owner.vertical_speed_banner.text = "vertical speed " + str(horizontalVelocity.y)
	owner.hoizontal_speed_banner.text ="horizontal speed " + str(horizontalVelocity.x) +" "+str(horizontalVelocity.y)
	owner.startjump.text = "jump? " +"false"



func moveLogic(delta):
	
		
	if get_input()["right"] and !get_input()["left"]:
		if !startedMoving:
			horizontalVelocity = calculate_horizontal_velocity("right")
			startedMoving = true
	
	if get_input()["left"] and !get_input()["right"]:
		if !startedMoving:
			horizontalVelocity = calculate_horizontal_velocity("left")
			startedMoving = true
	if get_input()["left"] and get_input()["right"]:
		emit_signal("finished","idle")
	if get_input()["left"] or get_input()["right"]:
		horizontalVelocity+=gravity*delta
		horizontalVelocity=owner.move_and_slide(horizontalVelocity,Vector2.UP)
	if get_input()["jump"]:
		emit_signal("finished","jump")
	if !get_input()["right"] and !get_input()["left"]:
		emit_signal("finished","idle")



func update(delta):
	moveLogic(delta)
	update_display()
	
