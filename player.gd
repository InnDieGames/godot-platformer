extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -750.0
const GAME_OVER_THRESHOLD = 5e3
var health = 3

@onready var _animated_sprite = $AnimatedSprite2D

func gravity(delta: float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
func input():
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction > 0:
		_animated_sprite.play("right")
	elif direction < 0:
		_animated_sprite.play("left")
	else:
		_animated_sprite.stop()

func collisions():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider is RigidBody2D:
			# Apply impulse opposite to the collision normal
			var push_force = 80.0
			collider.apply_central_impulse(-collision.get_normal() * push_force)

func check_game_over():
	if (position.y > GAME_OVER_THRESHOLD):
		print("You dead :(")
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	gravity(delta)
	input()

	move_and_slide()
	
	collisions()
	
	check_game_over()


func _on_area_area_entered(area: Area2D) -> void:
	print("entered")
	if (area.is_in_group("damage")):
		health -= 1
		print("you suffered damage :(. remaining health: "+ str(health))
		area.queue_free()
		if (health == 0):
			get_tree().call_deferred("reload_current_scene")
