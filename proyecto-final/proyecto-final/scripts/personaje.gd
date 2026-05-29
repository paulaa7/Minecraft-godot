extends CharacterBody3D

var SPEED = 9.0
const MAX_SPEED = 13.0
const JUMP_VELOCITY = 13
const sensibilidad = 0.002 #para el cursor

@onready var camara = $Camera3D
@onready var ray_cast_3d = $Camera3D/RayCast3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y = rotation.y - event.relative.x * sensibilidad
		camara.rotation.x = camara.rotation.x - event.relative.y * sensibilidad
		camara.rotation.x = clamp(camara.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += (get_gravity()-Vector3(0, 40, 0)) * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0
		velocity.z = 0
		
	if Input.is_action_just_pressed("Correr"):
		if SPEED == MAX_SPEED:
			SPEED -= 4
		else:
			SPEED = MAX_SPEED
		
	
	#para click izquierdo
	if Input.is_action_just_pressed("click_izq"):
		if ray_cast_3d.is_colliding():
			if ray_cast_3d.get_collider().has_method("quitar_bloque"):
				ray_cast_3d.get_collider().quitar_bloque(ray_cast_3d.get_collision_point()-
														ray_cast_3d.get_collision_normal())

	#para click derecho
	if Input.is_action_just_pressed("click_der"):
		if ray_cast_3d.is_colliding():
			var objeto : Node = null
			objeto = ray_cast_3d.get_collider()
			if objeto.name == "Palanca" || objeto.name == "Boton":
				if ray_cast_3d.get_collider().has_method("activar_ascensor"):
					ray_cast_3d.get_collider().activar_ascensor()
			elif objeto.name == "flor":
				if ray_cast_3d.get_collider().has_method("abrir_puente"):
					ray_cast_3d.get_collider().abrir_puente()
			elif ray_cast_3d.get_collider().has_method("poner_bloque"):
				ray_cast_3d.get_collider().poner_bloque(ray_cast_3d.get_collision_point()+
													ray_cast_3d.get_collision_normal(), 5)

	move_and_slide()
