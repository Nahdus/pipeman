extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) onready var hoizontal_speed_banner =$horizontalSpeed
export(NodePath) onready var vertical_speed_banner =$verticalSpeed
export(NodePath) onready var startjump = $startJump
onready var floorDetector = $floorDetector
onready var ceilingDetector = $ceilingDetector
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func checkFloor():
	return floorDetector.get_node("floorDetect").is_colliding() or floorDetector.get_node("floorDetect2").is_colliding() or floorDetector.get_node("floorDetect3").is_colliding()


func checkCeiling():
	return ceilingDetector.get_node("detectCeiling").is_colliding()

func _draw():
	var radius = 10

