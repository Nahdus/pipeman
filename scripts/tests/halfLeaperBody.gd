extends KinematicBody2D


var height = 30
var distance = 60
var time = 0.5
var dir = 1
onready var referance = get_parent().get_child(1)
var gravity = -(2*(height/2))/pow((time/2),2)
var vertical_speed = gravity*(time/2)
var horizontal_speed = -(vertical_speed*(distance/2))/(4*(height/2))


func _ready():
	print_debug(horizontal_speed)
	pass


func _process(delta):
	vertical_speed = vertical_speed-gravity*delta
	if self.is_on_floor():
		dir = - dir
#		horizontal_speed=dir*horizontal_speed
		vertical_speed = gravity*(time/2)
		referance.redraw()
	move_and_slide(Vector2(dir*horizontal_speed,vertical_speed),Vector2.UP)
