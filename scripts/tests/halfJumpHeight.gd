extends Line2D
onready var referance = get_parent().get_child(0)
onready var base = referance.position
export var x_offset:float = 0.0
func _ready():
	self.width = 0.5
	self.add_point(Vector2(base.x+x_offset,base.y))
	self.add_point(Vector2(base.x+x_offset,-referance.height/2))
#	self.add_point(Vector2(base.x,base.y+referance.height))
#	pass
