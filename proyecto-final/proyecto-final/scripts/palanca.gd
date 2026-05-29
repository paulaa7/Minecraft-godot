extends StaticBody3D
@export var activar := "activar_ascensor"
@onready var palanca := $"../.."
@export var speed := 6.0
@export var min_z := 50
@export var max_z := -50
var activo = false


func activar_ascensor():
	if activo:
		palanca.rotation.z = deg_to_rad(min_z)
	else:
		palanca.rotation.z = deg_to_rad(max_z)
		
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
