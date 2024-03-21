extends Label

var start_position = Vector2()


func _ready():
	start_position = rect_position


func _on_stateMachine_state_changed(current_state):
	text = String(current_state.get_name())
	
