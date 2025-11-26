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
var senha_correta = [1, 9, 1, 5]


func _ready():
	historia.hide()
	relogio.hide()
	susurro.hide()

	# sinais
	n1.pressed.connect(func(): apertou(0))
	n2.pressed.connect(func(): apertou(1))
	n3.pressed.connect(func(): apertou(5))
	n4.pressed.connect(func(): apertou(9))
	clicar_na_dica.pressed.connect(func(): dica_aparecer())

	atualizar_texto()
	iniciar_contagem_dica()


func iniciar_contagem_dica() -> void:
	for i in range(30, 0, -1):
		await get_tree().create_timer(1.0).timeout
		dica.text = "Dica: " + str(i)

	# quando chega no final
	dica.text = "Dica: Ano em que o livro foi publicado"


func apertou(valor: int):
	res_array.append(valor)
	atualizar_texto()


func atualizar_texto():
	res.text = str(res_array)

	if res_array.size() == 4:
		ver_correto()


func ver_correto(): 
	if res_array == senha_correta:
		excluir_tela()
	else:
		susurro.show()
		familia.play()
		res_array.clear()
		atualizar_texto()


func excluir_tela():
	# esconder ao invés de destruir (HTML5 é chato com queue_free)
	n1.hide()
	n2.hide()
	n3.hide()
	n4.hide()
	res.hide()
	dica.hide()
	objetivo.hide()

	proxima_fase()


func proxima_fase():
	historia.show()
	relogio.show()
	audio.play()

	for i in range(43, 0, -1):
		await get_tree().create_timer(1.0).timeout
		relogio.text = str(i)

	# quando terminar o tempo → troca de cena
	get_tree().change_scene_to_file("res://desafios/des2/des2.tscn")


func dica_aparecer():
	dica.text = "1915"
