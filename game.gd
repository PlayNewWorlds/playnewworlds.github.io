extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	check_reset()


func check_reset():
	if Input.is_action_just_pressed(&"reset"):
		print("received reset signal")
		get_tree().reload_current_scene()
