extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@onready var mensagem_power_up: Label = $MensagemPowerUP


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.ativar_dash()
		body.brilhar()
		queue_free()
	return
	mensagem_power_up.text = "Dash coletado use o com shift"
	
	
