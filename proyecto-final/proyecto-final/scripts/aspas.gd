extends Node3D
@export var activar := "activar_cabeza"
var activa := true
var angulo := 0.0

@export var rotation_speed_deg := 80.0

func _process(delta):
	if Input.is_action_just_pressed(activar):
		activa = !activa
	if activa:
		rotation.z -= deg_to_rad(rotation_speed_deg * delta)
