extends KinematicBody2D

var height = 30
var time = 0.5

var gravity = -(2*height)/pow((time/2),2)
var vertical_speed = gravity*(time/2)
onready var floorcheck = $floorCheck

func _ready():
	pass



func _process(delta):
	vertical_speed = vertical_speed-gravity*delta
	if self.is_on_floor():
		print_debug("on floor")
		vertical_speed = gravity*(time/2)
	move_and_slide(Vector2(0,vertical_speed),Vector2.UP)
	pass
