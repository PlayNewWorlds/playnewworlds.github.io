extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var ZoomSpeed: Vector2 = Vector2(0.2, 0.2)
	
	if Input.is_action_just_released("scroll_up"):
		zoom += ZoomSpeed
	
	if Input.is_action_just_released("scroll_down"):
		zoom -= ZoomSpeed
