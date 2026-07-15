extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void: 
	# Es muy importante validar que sea el jugador para que los enemigos 
	# no se maten entre ellos si chocan por accidente con la zona
	if body.is_in_group("player"):
		print("Game Over :( ") 
		Engine.time_scale = 0.5 # dura mas tiempo es como un video de youtube xd
		body.get_node("CollisionShape2D").queue_free() # eliminamos la colision para que empiece a caerse del mapa
		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1 # dejar tiempo normal
	
	# ❌ ELIMINAMOS la recarga directa de la escena
	# get_tree().reload_current_scene() 
	
	# ✅ LLAMAMOS al Singleton para que decida si reinicia el nivel o vuelve al nivel 1
	Global.perder_vida()
