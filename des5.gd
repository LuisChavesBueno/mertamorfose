extends Node2D

@onready var objetivo = $objetivo
@onready var p1 = $p1 
@onready var p2 = $p2 
@onready var p3 = $p3 
@onready var historia = $historia
@onready var relogio = $relogio
@onready var audio = $audio

func _ready(): 
	p1.hide()
	p2.hide()
	p3.hide()
	objetivo.hide()
	tempo_relogio()
	
	p1.pressed.connect(func(): resposta(p1))
	p2.pressed.connect(func(): resposta(p2))
	p3.pressed.connect(func(): resposta(p3))
	
func tempo_relogio(): 
	audio.play()
	for i in range(30,0,-1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)
	relogio.hide()
	historia.hide()
	objetivo.show()
	p1.show()
	p2.show()
	p3.show()

func resposta(r):
	if r == p1: 
		get_tree().change_scene_to_file("res://desafios/final/final.tscn")
	elif r == p2: 
		get_tree().change_scene_to_file("res://desafios/des1/ds1tscn.tscn")
	else: 
		get_tree().change_scene_to_file("res://desafios/des1/ds1tscn.tscn")
