extends Node2D
@onready var sonido_salto: AudioStreamPlayer = $sonidoSalto 
@export var fuerza_impulso:float = 340

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.aplicar_impulso_hacia_arriba(fuerza_impulso)
	sonido_salto.play()
