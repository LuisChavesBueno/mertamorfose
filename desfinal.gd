extends Node2D

@onready var historia = $historia
@onready var relogio = $relogio
@onready var frase_termino = $frase_termino
@onready var audio = $audio

func _ready() -> void:
	frase_termino.hide()
	await tempo_relogio()  # IMPORTANTE: colocar await para funcionar no HTML5

func tempo_relogio() -> void:
	audio.play()
	
	# Contagem regressiva
	for i in range(30, 0, -1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)
	frase_termino.show()
	
	# Depois que acabar o tempo
