extends Node2D

@onready var relogio = $relogio
@onready var historia = $historia
@onready var b1 = $Button
@onready var b2 = $Button2
@onready var b3 = $Button3
@onready var desafio = $desafio
@onready var audio = $audio

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	b1.hide()
	b2.hide()
	b3.hide()
	desafio.hide()
	
	relogio_mecanimos()
	
	b1.pressed.connect(func(): resposta(b1))
	b2.pressed.connect(func(): resposta(b2))
	b3.pressed.connect(func(): resposta(b3))

func relogio_mecanimos(): 
	audio.play()
	for i in range(30,0,-1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)
	relogio.hide()
	historia.hide()
	desafio.show()
	b1.show()
	b2.show()
	b3.show()
	
func resposta(r):
	if r == b1: 
		get_tree().change_scene_to_file("C:/Users/User/Documents/projetos/mertamorfose/desafios/des1/ds1tscn.tscn")
	elif r == b2: 
		get_tree().change_scene_to_file("C:/Users/User/Documents/projetos/mertamorfose/desafios/des5/des5.tscn")
	elif r == b3: 
		get_tree().change_scene_to_file("C:/Users/User/Documents/projetos/mertamorfose/desafios/des1/ds1tscn.tscn")
