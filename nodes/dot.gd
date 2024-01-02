extends Area2D
class_name GameDot


func _on_body_entered(body: Node2D) -> void:
	if body is GameCrate:
		Variables.covered_crates += 1


func _on_body_exited(body: Node2D) -> void:
	print("body exited, body: " + body.name)
	if body is GameCrate:
		Variables.covered_crates -= 1
