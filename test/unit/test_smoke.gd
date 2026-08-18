extends GutTest

# Minimal smoke tests: catch load-time script/scene errors and a basic
# regression check on the gravity math, without depending on a running
# game loop.

const PlayerScene: PackedScene = preload("res://player/player.tscn")


func test_game_scene_loads_and_instantiates():
	var game_scene: PackedScene = load("res://game.tscn")
	assert_not_null(game_scene, "game.tscn should load")

	var game: Node = game_scene.instantiate()
	assert_not_null(game, "game.tscn should instantiate")
	game.free()


func test_player_scene_loads_and_instantiates():
	var player: Node = PlayerScene.instantiate()
	assert_not_null(player, "player.tscn should instantiate")
	player.free()


func test_gravity_pulls_toward_parent_body():
	var player = PlayerScene.instantiate()

	# A body directly to the right should pull with a positive x
	# acceleration and (approximately) zero y acceleration.
	var pull: Vector2 = player.gravity(Vector2(0, 0), Vector2(100, 0), 1.0)
	assert_gt(pull.x, 0.0, "gravity should pull toward the parent body")
	assert_almost_eq(pull.y, 0.0, 0.0001, "no y-pull for a horizontally offset body")

	player.free()
