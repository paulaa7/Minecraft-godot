extends Node3D

@export var activar_ascensor := "activar_ascensor"
@export var speed := 3.0
@export var min_y := 3.1
@export var max_y := 23

var subir := false
var activo := false

func _process(delta):
	if Input.is_action_just_pressed(activar_ascensor):
		activo = true
		subir = !subir

	if not activo:
		return

	if subir and global_position.y < max_y:
		global_position.y += speed * delta
	elif not subir and global_position.y > min_y:
		global_position.y -= speed * delta
