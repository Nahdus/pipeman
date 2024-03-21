extends "res://scripts/playerScripts/motion/motion.gd"



func get_input() -> Dictionary:
	return {
		"just_jump": Input.is_action_just_pressed("jump") == true,
		"jump": Input.is_action_pressed("jump") == true,
		"released_jump": Input.is_action_just_released("jump") == true,
	}

func initialize(speed, velocity):
	initializedJump=true
	jumpvelocity = Vector2(speed.x,velocity.y)
	pass

func enter():
	if !initializedJump:
		owner.move_and_slide(Vector2(0.0,0.0),Vector2.UP)
		jumpvelocity = Vector2(0.0,-(2.0*jumpHeight)/timeToPeak)
		gravity = Vector2(0.0,(2.0*jumpHeight)/pow(timeToPeak,2))
	


func exit():
	initializedJump=false
	startjump = false
	
	pass


func update_display():
	owner.vertical_speed_banner.text = "vertical speed " + str(jumpvelocity.x) +" "+str(jumpvelocity.y)
	owner.hoizontal_speed_banner.text ="horizontal speed " + str(jumpvelocity.x) +" "+str(0.0)
	owner.startjump.text = "jump? " +str(startjump)



func jump_logic(delta):

	owner.move_and_slide(jumpvelocity,Vector2.UP)
	
	jumpvelocity = jumpvelocity+gravity*delta
	if !owner.checkFloor():
		startjump=true
	if owner.checkFloor() and owner.checkCeiling():
		startjump=true
	if startjump and owner.checkFloor():
		emit_signal("finished","previous")

func animateJump(delta):
	pass



func apply_gravity(delta):
	pass
	
func apply_velocity() -> void:
	pass
	

func update(delta):
	jump_logic(delta)
	animateJump(delta)
	update_display()


