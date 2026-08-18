extends Node2D

var angle: float = 0


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$"TargetText".show()


func _process(_delta: float) -> void:
	circular_orbit()


func radius() -> float:
	return 100


func orbital_velocity(radius: float) -> float:
	return sqrt(0.2 * 1000 / radius)


func circular_orbit():
	var current_radius: float = radius()
	angle += orbital_velocity(current_radius) * get_process_delta_time()
	var x_pos = cos(angle)
	var y_pos = sin(angle)

	position.x = current_radius * x_pos
	position.y = current_radius * y_pos
