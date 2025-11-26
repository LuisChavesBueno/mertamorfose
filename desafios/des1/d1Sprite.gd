extends Node2D

@onready var n1 = $n1
@onready var n2 = $n2
@onready var n3 = $n3
@onready var n4 = $n4

@onready var res = $Res

@onready var objetivo = $Objetivo
@onready var historia = $historia
@onready var relogio = $relogio
@onready var clicar_na_dica = $clicar_na_dica

@onready var audio = $sons_historia
@onready var familia = $familia
@onready var susurro = $susurro
@onready var dica = $dica

var res_array: Array = []
var botao_dica_clicado = false

func _ready():
	historia.hide()
	relogio.hide()
	susurro.hide()
		
	# Conecta os sinais dos botões
	n1.pressed.connect(func(): apertou(0))
	n2.pressed.connect(func(): apertou(1))
	n3.pressed.connect(func(): apertou(5))
	n4.pressed.connect(func(): apertou(9))
	clicar_na_dica.pressed.connect(func(): dica_aparecer())
	
	atualizar_texto()
	
	for i in range(30, 0, -1): 
		await get_tree().create_timer(1.0).timeout
		# Atualiza o Label na inicialização
		dica.text = str("Dica: ", i)
		
		if i == 1: 
			dica.text = str("Dica: Ano que o livro publicado")
			return
	
func apertou(valor: int):
	# Adiciona o número da tecla no array
	res_array.append(valor)
	atualizar_texto()


func atualizar_texto():
	# Mostra o array no Label
	res.text = str(res_array)
	if res_array.size() == 4:
		ver_correto() 

func ver_correto(): 
	if res_array[0] == 1 and res_array[1] == 9 and res_array[2] == 1 and res_array[3] == 5: 
		excluir_tela()
	else: 
		susurro.show()
		familia.play()
		res_array = []
		
		 
func excluir_tela(): 
	n1.queue_free() 
	n2.queue_free() 
	n3.queue_free() 
	n4.queue_free() 
	res.queue_free()
	dica.hide()
	
	objetivo.queue_free()
	proxema_fase()

func proxema_fase(): 
	historia.show()
	relogio.show()
	audio.play()
	for i in range(43, 0, -1): 
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)
		if i == 1: 
			get_tree().change_scene_to_file("res://desafios/des2/des2.tscn")
func dica_aparecer(): 
	dica.text = ("1915")
	return
