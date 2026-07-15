extends StaticBody2D

@export var fuerza_rebote: float = 600.0

func _on_zona_salto_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Llamamos al método 'rebotar' que creaste en el script de Chasca
		if body.has_method("rebotar"):
			body.rebotar(fuerza_rebote)
