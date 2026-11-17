extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	body.ativar_dash()
	body.brilhar()
	queue_free()
