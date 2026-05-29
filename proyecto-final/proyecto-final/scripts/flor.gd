extends StaticBody3D
@export var activar := "abrir_puente"
@onready var flor_palanca := $"../.."
@export var duracion := 6.0
@export var velocidad := deg_to_rad(55.0)
var activo := true
var girando := false
var tiempo_giro := 0.0
var direccion := 1.0

func abrir_puente():
	direccion = 1.0 if activo else -1.0
	tiempo_giro = 0.0
	girando = true
	pulsar_accion(activar)
	activo = !activo


func _process(delta):
	if not girando:
		return
	flor_palanca.rotate_y(velocidad * direccion * delta)
	tiempo_giro += delta
	if tiempo_giro >= duracion:
		girando = false

func pulsar_accion(nombre):
	var ev_press := InputEventAction.new()
	ev_press.action = nombre
	ev_press.pressed = true
	Input.parse_input_event(ev_press)

	var ev_release := InputEventAction.new()
	ev_release.action = nombre
	ev_release.pressed = false
	Input.parse_input_event(ev_release)
