extends KinematicBody2D

export var speed: = Vector2(100.0, 0.0) #Velocidad inicial
var vel: = Vector2.ZERO #Velocidad
var ace: = Vector2(0.0, 9.8) #aceleracion

#Funcion que inicia todo el codigo
func _ready() -> void:
	set_physics_process(true)

#Se procesan las fisicas del juego
func _physics_process(delta: float) -> void:
	var pos: = movimiento() #Variable de posicion
	vel = calculate_move_velocity(vel, pos, speed) 
	vel = move_and_slide(vel, ace) #Con esta funcion se mueve el proyectil

#Aquí se calcula el movimiento del proyectil
func movimiento() -> Vector2:
	return Vector2(speed.x * get_physics_process_delta_time(), 0.5 * ace.y * 
		get_physics_process_delta_time() * get_physics_process_delta_time())

#Esta funcion calcula la velocidad del proyectil
func calculate_move_velocity(velocity: Vector2, position: Vector2, speed: Vector2) -> Vector2:
	var out: = velocity #Esta es la variable de salida
	out.x = speed.x * position.x
	out.y += ace.y * get_physics_process_delta_time()
	return out

func contacto() -> void:
	var tiempo: = 650/speed.x
	var dis: = 0.5 * ace.y * tiempo
	print("Tiempo: ", tiempo)
	print("distancia: ", dis)
