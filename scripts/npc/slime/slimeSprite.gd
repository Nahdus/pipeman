extends Sprite



func _ready():
	$sheen.position=Vector2(-7,2)
	
	
func flip(dir):
	if dir == "right":
		$sheen.position=Vector2(8,2)
	if dir == "left":
		$sheen.position=Vector2(-7,2)
		


