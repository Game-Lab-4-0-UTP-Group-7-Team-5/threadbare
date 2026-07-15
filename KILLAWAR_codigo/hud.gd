extends CanvasLayer

@onready var contenedor = $ContenedorCorazones
# Asegúrate de que esta ruta coincida con los nombres que le pusiste a tus nodos
@onready var texto_tumis = $ContenedorTumis/TextoTumis
@onready var texto_nivel = $ContenedorTumis/TextoNivel

# Arrastra tus imágenes desde el Sistema de Archivos a estas rutas o asegúrate de que el nombre coincida
var textura_lleno = preload("res://KILLAWAR_recursos/sprites/corazon_lleno.png")
var textura_vacio = preload("res://KILLAWAR_recursos/sprites/corazon_vacio.png")

func _ready():
	actualizar_corazones()
	configurar_nombre_nivel()
	
func _process(delta: float) -> void:
	texto_tumis.text = str(Global.tumis_recolectados)

func configurar_nombre_nivel():
	# get_tree().current_scene.name lee el nombre del nodo raíz del mapa actual
	var nombre_escena = get_tree().current_scene.name
	
	# Comparamos el nombre del archivo para poner un texto elegante en la pantalla
	if nombre_escena == "nivel_1":
		texto_nivel.text = "Nivel 1"
	elif nombre_escena == "nivel_2":
		texto_nivel.text = "Nivel 2"
	elif nombre_escena == "nivel_3":
		texto_nivel.text = "Nivel 3"
	elif nombre_escena == "cueva":
		texto_nivel.text = "Cueva"
	else:
		# Si creas más niveles en el futuro, esto los capitaliza automáticamente
		texto_nivel.text = nombre_escena.capitalize()
		
func actualizar_corazones():
	# 1. Limpiamos cualquier corazón viejo que haya quedado en pantalla
	for hijo in contenedor.get_children():
		hijo.queue_free()
	
	# 2. Dibujamos los 5 corazones (MAX_VIDAS)
	for i in range(Global.MAX_VIDAS):
		var icono = TextureRect.new()
		
		# Si el número de corazón que estamos dibujando es menor a las vidas actuales, se pinta lleno
		if i < Global.vidas_actuales:
			icono.texture = textura_lleno
		else:
			icono.texture = textura_vacio
			
		# Añadimos el corazón a la pantalla
		contenedor.add_child(icono)
