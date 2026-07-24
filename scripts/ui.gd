extends Control

func _ready() -> void:
	Global.health_changed.connect(_on_health_changed)

func _on_health_changed(new_amount):
	$Label.text = str(new_amount)
