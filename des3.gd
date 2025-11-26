extends Node2D

@onready var historia = $historia
@onready var relogio = $relogio
@onready var audio = $audio
@onready var desafio = $desafio
@onready var b1 = $b1
@onready var b2 = $b2
@onready var b3 = $b3

var ativado = true
# Called when the node enters the scene tree for the first time.
func _ready(): 
	desafio.hide()
	b1.hide()
	b2.hide()
	b3.hide()
	
	for i in range(30,0,-1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)
		if ativado == true: 
			audio.play()
		ativado = false
	historia.queue_free()
	relogio.queue_free()
	
	desafio.show()
	b1.show()
	b2.show()
	b3.show()
	
	b1.pressed.connect(func(): resposta(b1))
	b2.pressed.connect(func(): resposta(b2))
	b3.pressed.connect(func(): resposta(b3))
	

func resposta(r): 
	if r == b1: 
		get_tree().change_scene_to_file("C:/Users/User/Documents/projetos/mertamorfose/desafios/des4/des4.tscn")
	elif r == b2: 
		get_tree().change_scene_to_file("C:/Users/User/Documents/projetos/mertamorfose/desafios/des1/ds1tscn.tscn")
	elif r == b3: 
		get_tree().change_scene_to_file("C:/Users/User/Documents/projetos/mertamorfose/desafios/des1/ds1tscn.tscn")
