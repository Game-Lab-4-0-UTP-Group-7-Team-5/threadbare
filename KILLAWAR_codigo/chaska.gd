extends CharacterBody2D

const SPEED = 95.0
const JUMP_VELOCITY = -340.0

# 1. Referencia al nodo de animación. 
# NOTA: En tu captura tienes AnimatedSprite2D, AnimatedSprite2D2 y AnimatedSprite2D3. 
# Asegúrate de colocar el nombre exacto del nodo que tiene la animación.
@onready var anim = $AnimatedSprite2D3 
@onready var sonido_salto: AudioStreamPlayer = $saltos 
@onready var sonido_caminar: AudioStreamPlayer = $caminar
#sonido_salto.play()

func _ready():
	add_to_group("player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sonido_salto.play()

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		
		# 2. Reproducir la animación de movimiento
		anim.play("new_animation") 
		
		# 3. Voltear el sprite según la dirección
		anim.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		# 4. Detener la animación
		anim.stop() 

	# --- LÓGICA DEL SONIDO DE CAMINAR ---
	# Chasca debe tener dirección Y estar tocando el suelo para que suenen los pasos
	if direction != 0 and is_on_floor():
		# Solo le damos play si el sonido NO se está reproduciendo actualmente
		if not sonido_caminar.playing:
			sonido_caminar.play()
	else:
		# Si se detiene o está saltando, detenemos el sonido
		if sonido_caminar.playing:
			sonido_caminar.stop()

	move_and_slide()
	
func aplicar_impulso_hacia_arriba(cantidad_de_impulso: float) -> void:
	velocity.y =  -cantidad_de_impulso
	
