extends AnimatableBody2D

const LEFT = -1
const RIGHT = 1

@export var moveDistance = 900
@export var moveSpeed = 300 # x per second

var startX
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startX = position.x

func _physics_process(delta: float) -> void:
	var currentPosition = position.x
	
	if (currentPosition >= startX + moveDistance):
		direction =  LEFT
	elif (currentPosition <= startX):
		direction = RIGHT

	move_local_x(direction * moveSpeed * delta)
