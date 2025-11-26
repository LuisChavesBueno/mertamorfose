extends Node2D

@onready var historia = $historia
@onready var relogio = $relogio
@onready var audio = $audio
@onready var desafio = $desafio
@onready var b1 = $b1
@onready var b2 = $b2
@onready var b3 = $b3

var ativado := true

func _ready(): 
	# Esconde tudo no início
	desafio.hide()
	b1.hide()
	b2.hide()
	b3.hide()

	# Contagem de 30 segundos
	for i in range(30, 0, -1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)

		if ativado:
			audio.play()
			ativado = false

	# Remove a narrativa
	historia.queue_free()
	relogio.queue_free()

	# Mostra os botões do desafio
	desafio.show()
	b1.show()
	b2.show()
	b3.show()

	# Conecta os botões
	b1.pressed.connect(func(): resposta(1))
	b2.pressed.connect(func(): resposta(2))
	b3.pressed.connect(func(): resposta(3))


func resposta(id): 
	match id:
		1:
			get_tree().change_scene_to_file("res://desafios/des4/des4.tscn")

		2, 3:
			get_tree().change_scene_to_file("res://desafios/des1/ds1tscn.tscn")
