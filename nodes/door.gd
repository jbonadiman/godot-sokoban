extends Area2D
class_name GameDoor


func _on_body_entered(body: Node2D) -> void:
	if body is GamePlayer:
		body.queue_free()
		print("You won!")
