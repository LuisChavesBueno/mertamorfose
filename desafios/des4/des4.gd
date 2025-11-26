extends Node2D

@onready var relogio = $relogio
@onready var historia = $historia
@onready var b1 = $Button
@onready var b2 = $Button2
@onready var b3 = $Button3
@onready var desafio = $desafio
@onready var audio = $audio

func _ready() -> void:
	# Esconde tudo no início
	b1.hide()
	b2.hide()
	b3.hide()
	desafio.hide()

	# Inicia a contagem
	start_relogio()

	# Conecta os botões
	b1.pressed.connect(func(): resposta(1))
	b2.pressed.connect(func(): resposta(2))
	b3.pressed.connect(func(): resposta(3))


func start_relogio() -> void:
	audio.play()

	for i in range(30, 0, -1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)

	# Depois do tempo acabar
	relogio.hide()
	historia.hide()

	desafio.show()
	b1.show()
	b2.show()
	b3.show()


func resposta(botao: int) -> void:
	match botao:
		1:
			get_tree().change_scene_to_file("res://desafios/des1/ds1tscn.tscn")
		2:
			get_tree().change_scene_to_file("res://desafios/des5/des5.tscn")
		3:
			get_tree().change_scene_to_file("res://desafios/des1/ds1tscn.tscn")
