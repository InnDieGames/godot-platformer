extends Area2D

const SPEED = 1000
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	move_local_x(direction * SPEED * delta)


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		print("you got hit by a bullet :(")
		get_tree().reload_current_scene()
		
