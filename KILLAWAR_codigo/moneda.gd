extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Verificamos que quien tocó el Tumi fue el jugador
	if body.is_in_group("player"):
		# Le sumamos 1 a la variable de nuestro Singleton
		Global.tumis_recolectados += 1
		
		# Borramos la moneda del mapa
		queue_free()	
