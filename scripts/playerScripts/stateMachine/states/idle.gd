extends "res://scripts/playerScripts/motion/onGround/onGround.gd"

func enter():
	horizontalVelocity = Vector2.ZERO
	print_debug("entered Idle")
	owner.get_node("AnimationPlayer").play("idle")


func updateDisplay():
	pass


func handle_input(event):
	return .handle_input(event)


func update(delta):
	updateDisplay()
	horizontalVelocity+=gravity*delta
	owner.move_and_slide(horizontalVelocity,Vector2.UP)
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
