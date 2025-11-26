extends Node2D

@onready var historia = $historia
@onready var relogio = $relogio
@onready var frase_termino = $frase_termino
@onready var audio = $audio

func _ready() -> void:
	frase_termino.hide()
	tempo_relogio()
func tempo_relogio(): 
	audio.play()
	for i in range(30,0,-1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)
	relogio.hide()
	historia.hide()
	frase_termino.show()
	
