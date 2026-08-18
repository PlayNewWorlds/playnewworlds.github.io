extends CharacterBody2D

const THRUST_FORCE = 10
const COLLISION_VELOCITY_COEFFICIENT= 0.75
const GRAVITATIONAL_CONSTANT = 1000


func gravity(satellite_position:Vector2, parent_position: Vector2, parent_mass: float = 1) -> Vector2:
	# Calculate the distance vector
	var r_vec: Vector2 = parent_position - satellite_position
	
	# Calculate the magnitude of the distance vector
	var r_magnitude: float = r_vec.length()
	
	# Normalize the distance vector
	var r_hat: Vector2 = r_vec.normalized()
	
	# Calculate the gravitational force magnitude
	var force: float = parent_mass * GRAVITATIONAL_CONSTANT / r_magnitude ** 2
	
	# Calculate acceleration of each body due to the other
	var acc: float = force / parent_mass
	
	# Calculate change in velocity
	var delta_vx: float = acc * r_hat.x
	var delta_vy: float = acc * r_hat.y

	#print("r_hat: %s" % r_hat)
	#print("acc %s" % acc)
	#print("distance: %s" % r_magnitude)
	
	return Vector2(delta_vx, delta_vy)


func apply_thrust(delta: float) -> void:
	var x_axis_input: float = Input.get_axis(&"thrust_left", &"thrust_right")
	var y_axis_input: float = Input.get_axis(&"thrust_up", &"thrust_down")
	
	# Get player thrust input
	var thrust_x := THRUST_FORCE * x_axis_input
	var thrust_y := THRUST_FORCE * y_axis_input
	
	# Apply thrust
	velocity.x += thrust_x * delta
	velocity.y += thrust_y * delta
	
	var is_thrusting: bool = bool(x_axis_input or y_axis_input)
	
	# Emit exhaust sound and particles
	$Exhaust.emitting = is_thrusting
	$Exhaust.direction.x = -thrust_x
	$Exhaust.direction.y = -thrust_y
	
	if is_thrusting and not $Exhaust/RocketThruster.is_playing():
		$Exhaust/RocketThruster.play()
	if not is_thrusting:
		$Exhaust/RocketThruster.stop()


func _init() -> void:
	velocity.x = 35.5
	velocity.y = 0


func _physics_process(delta: float) -> void:
	apply_thrust(delta)
	
	# Sum gravity for each body
	var delta_v: Vector2
	for parent_body in [[1, get_node("/root/World/World1").global_position], [0.2, get_node("/root/World/World1/Moon1").global_position]]:
		delta_v += gravity(position, parent_body[1], parent_body[0])
	
	# Apply gravity
	velocity.x += delta_v.x
	velocity.y += delta_v.y

	# Move based on the velocity and snap to the ground.
	# TODO: This information should be set to the CharacterBody properties instead of arguments: snap, Vector2.DOWN, Vector2.UP
	# TODO: Rename velocity to linear_velocity in the rest of the script.
	if move_and_slide():
		velocity.x *= COLLISION_VELOCITY_COEFFICIENT
		velocity.y *= COLLISION_VELOCITY_COEFFICIENT
		
	#print("px: %s py: %s" % [position.x, position.y])
	#print("vx: %s vy: %s" % [velocity.x, velocity.y])
	
	#camera.zoom
