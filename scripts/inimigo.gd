extends CharacterBody2D
## Inimigo da fase

const SPEED: float = 40.0

var direction: int = 1

@onready var ray_right: RayCast2D = $RayRight
@onready var ray_left: RayCast2D = $RayLeft
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if direction > 0 and ray_right.is_colliding():
		direction = -1
	elif direction < 0 and ray_left.is_colliding():
		direction = 1

	sprite.flip_h = direction > 0
	velocity.x = direction * SPEED
	move_and_slide()


func handle_player_collision(body: Node2D, collision_normal: Vector2) -> void:
	if not body.is_in_group("player"):
		return

	var player := body as CharacterBody2D
	if player == null:
		return

	if collision_normal.y < -0.7:
		player.call("bounce_on_enemy")
		queue_free()
		return

	GameManager.reset()
	get_tree().call_deferred("reload_current_scene")
