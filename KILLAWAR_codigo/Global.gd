extends Node

const MAX_VIDAS = 5
var vidas_actuales = MAX_VIDAS

# NUEVA VARIABLE: Memoria global de los Tumis
var tumis_recolectados = 0

func perder_vida():
	vidas_actuales -= 1
	
	if vidas_actuales > 0:
		# Si aún le quedan vidas, reinicia el nivel actual
		get_tree().reload_current_scene()
	else:
		# Si perdió todo, resetea las vidas y vuelve al Nivel 1
		restablecer_juego()

func restablecer_juego():
	vidas_actuales = MAX_VIDAS
	tumis_recolectados = 0 # Resetea las monedas al perder todo
	
	# Asegúrate de que esta ruta sea exactamente la de tu primer nivel
	get_tree().change_scene_to_file("res://KILLAWAR_escenas/nivel_1.tscn")
