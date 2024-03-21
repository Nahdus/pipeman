extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed =20
var walk = "left"
var pointA
var pointB

func flip(dir):
	if dir =="right":
		var slimeSprite = self.get_node("slimeSprite")
		slimeSprite.flip_h = true
		slimeSprite.flip(dir)
		$slimeCollider.position = Vector2(9,0)
		walk = "right"
	if dir =="left":
		var slimeSprite = self.get_node("slimeSprite")
		slimeSprite.flip_h = false
		slimeSprite.flip(dir)
		$slimeCollider.position = Vector2(0,0)
		walk = "left"



# Called when the node enters the scene tree for the first time.
func _ready():
	pointA = self.get_parent().get_node("pointA")
	pointB = self.get_parent().get_node("pointB")
	



func _process(delta):
	if walk =="left":
		self.position.x -= speed*delta
		if self.position.x<pointA.position.x:
			flip("right")
	if walk == "right":
		self.position.x += speed*delta
		if self.position.x>pointB.position.x:
			flip("left")	
