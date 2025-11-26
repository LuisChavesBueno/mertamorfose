extends Node2D

var valor_final = 0 

@onready var Button1 = $Button
@onready var Button2 = $Button2
@onready var Button3 = $Button3
@onready var Button4 = $Button4
@onready var Button5 = $Button5
@onready var Button6 = $Button6
@onready var Button7 = $Button7
@onready var Button8 = $Button8
@onready var Button9 = $frase


func _ready(): 
	Button1.pressed.connect(func(): Button1.queue_free())
	Button2.pressed.connect(func(): Button2.queue_free())
	Button3.pressed.connect(func(): Button3.queue_free())
	Button4.pressed.connect(func(): Button4.queue_free())
	Button5.pressed.connect(func(): Button5.queue_free())
	Button6.pressed.connect(func(): Button6.queue_free())
	Button7.pressed.connect(func(): Button7.queue_free())
	Button8.pressed.connect(func(): Button8.queue_free())
	Button9.pressed.connect(func(): Button9.queue_free())

func _process(delta: float): 
	if get_child_count() == 1: 
		print("ganouh")
		get_tree().change_scene_to_file("C:/Users/User/Documents/projetos/mertamorfose/desafios/des3/des_3.tscn")
