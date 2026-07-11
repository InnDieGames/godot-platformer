extends AnimatableBody2D
	
var startX
var moveDistance = 900
var moveSpeed = 300 # x per second
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startX = position.x

func _physics_process(delta: float) -> void:
	var currentPosition = position.x
	
	if (currentPosition >= startX + moveDistance):
		direction = -1
	elif (currentPosition <= startX):
		direction = 1

	move_local_x(direction * moveSpeed * delta)
