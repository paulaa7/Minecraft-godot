extends Node3D
@export var activar := "activar_base"
var activa := false
var angulo := 0.0

@export var rotation_speed_deg := 100.0

func _process(delta):
	if Input.is_action_just_pressed(activar):
		activa = !activa
	if activa:
		rotation.y += deg_to_rad(rotation_speed_deg * delta)
