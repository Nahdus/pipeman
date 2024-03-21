extends Node2D
# Switching between fullscreen and not fullscreen by pressing esc
export onready var playerPos = $playerPosition/Position2D


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		OS.window_fullscreen = !OS.window_fullscreen
	if Input.is_action_just_pressed("reset"):
		$player.position =playerPos.position


		
