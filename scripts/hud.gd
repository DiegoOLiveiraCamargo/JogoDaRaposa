extends CanvasLayer
## HUD que mostra a quantidade de cerejas coletadas.
## Ouve o sinal "score_changed" do autoload GameManager.

@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var dash_message: Label = $DashMessage
@onready var dash_message_timer: Timer = $DashMessageTimer


func _ready() -> void:
	GameManager.score_changed.connect(_on_score_changed)
	GameManager.dash_unlocked.connect(_on_dash_unlocked)
	_update(GameManager.score)
	dash_message.hide()


func _on_score_changed(new_score: int) -> void:
	_update(new_score)


func _update(value: int) -> void:
	score_label.text = "Cerejas: %d" % value


func _on_dash_unlocked() -> void:
	dash_message.text = "Dash adquirido! Pressione Shift para usar."
	dash_message.show()
	dash_message_timer.start()


func _on_dash_message_timer_timeout() -> void:
	dash_message.hide()
