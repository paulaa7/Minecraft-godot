extends StaticBody3D
@export var activar := "activar_ascensor"
@onready var boton := $".."
@export var speed := 6.0
@export var min_y := 22.2
@export var max_y := 21.8
var activo = true


func activar_ascensor():
	if activo:
		boton.position.y = max_y
	else:
		boton.position.y = min_y
		
	pulsar_accion(activar)
	activo = !activo


func pulsar_accion(nombre):
	var ev_press := InputEventAction.new()
	ev_press.action = nombre
	ev_press.pressed = true
	Input.parse_input_event(ev_press)
	var ev_release := InputEventAction.new()
	ev_release.action = nombre
	ev_release.pressed = false
	Input.parse_input_event(ev_release)
