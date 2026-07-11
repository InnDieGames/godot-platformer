extends CharacterBody2D

const COOLDOWN = .5
const BULLET : Resource = preload("res://Bullet.tscn")
var timer : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func gravity(delta: float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
func _physics_process(delta: float) -> void:
	gravity(delta)
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	
	if (timer >= COOLDOWN):
		timer = 0
		var newBullet : Area2D = BULLET.instantiate()
		newBullet.global_position = global_position
		get_tree().root.add_child(newBullet)
		print("pew")
