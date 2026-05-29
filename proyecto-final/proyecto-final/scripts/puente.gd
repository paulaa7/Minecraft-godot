extends Node3D

@export var abrir_puente := "abrir_puente"
@export var speed := 2
@export var min_y := 3.1
@export var max_y := 23

@onready var nodo_giro1 = $nodo_giro
@onready var nodo_giro2 = $nodo_giro/nodo_giro2
@onready var nodo_giro3 = $nodo_giro/nodo_giro2/nodo_giro3
@onready var nodo_giro4 = $nodo_giro/nodo_giro2/nodo_giro3/nodo_giro4
@onready var nodo_giro5 = $nodo_giro/nodo_giro2/nodo_giro3/nodo_giro4/nodo_giro5
@onready var audio = $AudioStreamPlayer3D

var abrir := false
var activo := false

func _process(delta):
	if Input.is_action_just_pressed(abrir_puente):
		activo = true
		abrir = !abrir
		audio.play()

	if not activo:
		return

	if abrir:
		if nodo_giro1.rotation.x > deg_to_rad(0): # de 180 a 0 - ✓
			nodo_giro1.rotation.x -= speed * delta
			if nodo_giro1.rotation.x < deg_to_rad(0): nodo_giro1.rotation.x = deg_to_rad(0)
			
		elif nodo_giro2.rotation.x > deg_to_rad(90): # de 180 a 90 - ✓
			nodo_giro2.rotation.x -= speed * delta
			if nodo_giro2.rotation.x < deg_to_rad(90): nodo_giro2.rotation.x = deg_to_rad(89.9)
			
		elif nodo_giro3.rotation.x > deg_to_rad(0): # de 90 a 0 restando ✓
			nodo_giro3.rotation.x -= speed * delta
			if nodo_giro3.rotation.x < deg_to_rad(0): nodo_giro3.rotation.x = deg_to_rad(0)
			
		elif nodo_giro4.rotation.x > deg_to_rad(-90):  #de 0 a -90 restando ✓
			nodo_giro4.rotation.x -= speed * delta
			if nodo_giro4.rotation.x < deg_to_rad(-90): nodo_giro4.rotation.x = deg_to_rad(-90)
			
		elif fmod(nodo_giro5.rotation.x - speed * delta + PI * 2, PI * 2) > deg_to_rad(90):
			nodo_giro5.rotation.x -= speed * delta  # de -90 a 90 restando ✓
			if nodo_giro5.rotation.x < -deg_to_rad(267.57): nodo_giro5.rotation.x = deg_to_rad(90)
		
	else:
		if nodo_giro5.rotation.x < deg_to_rad(270):  #de 90 a -90  ✓
			nodo_giro5.rotation.x += speed * delta
			if nodo_giro5.rotation.x > deg_to_rad(270): nodo_giro5.rotation.x = deg_to_rad(270)
			
		elif nodo_giro4.rotation.x < 0:   # de -90 a 0 ✓
			nodo_giro4.rotation.x += speed * delta
			if nodo_giro4.rotation.x > deg_to_rad(0): nodo_giro4.rotation.x = deg_to_rad(0)
			
		elif nodo_giro3.rotation.x < deg_to_rad(90): # de 0 a 90 ✓
			nodo_giro3.rotation.x += speed * delta
			if nodo_giro3.rotation.x > deg_to_rad(90): nodo_giro3.rotation.x = deg_to_rad(90)
			
		elif nodo_giro2.rotation.x < deg_to_rad(180): # de 90 a 180
			nodo_giro2.rotation.x += speed * delta
			if nodo_giro2.rotation.x > deg_to_rad(180): nodo_giro2.rotation.x = deg_to_rad(180)
			
		elif nodo_giro1.rotation.x < deg_to_rad(180): # de 0 a 180
			nodo_giro1.rotation.x += speed * delta
			if nodo_giro1.rotation.x > deg_to_rad(180): nodo_giro1.rotation.x = deg_to_rad(180)
