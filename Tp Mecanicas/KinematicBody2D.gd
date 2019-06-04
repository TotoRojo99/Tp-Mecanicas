extends KinematicBody2D

var velocidad = Vector2(0,0);
var gravedad = 10;
var salto = true
var vector2 = Vector2(0,-1)
var puede_saltar = true
var cargando = false
var saltolisto = false
var dashder = false
var dashizq = false
var veldash = 600
var golpe = true
var saltoG = false
func _physics_process(delta):
	
	velocidad.y += gravedad;
	print(gravedad)
		
	
	if Input.is_action_pressed("ui_right")and velocidad.x < 500:
		$Dash.stop()
		velocidad.x += 10;
	if Input.is_action_pressed("ui_left") and velocidad.x > -500:
		$Dash.stop()
		velocidad.x -= 10;
	if Input.is_action_just_released("ui_right"):
		velocidad.x = 0;
	if Input.is_action_just_released("ui_left"):
		velocidad.x = 0;
	
	move_and_slide(velocidad, vector2);
	pass # Replace with function body.

func _process(delta):
	if Input. is_action_just_pressed("ui_up") and is_on_floor():
		if puede_saltar:
			velocidad.y = -250
			salto=false
		
	
	
	if Input. is_action_pressed("ui_up") and is_on_floor():
		if not cargando:
			$saltogrande.start()
			saltoG = true
	
	if Input. is_action_just_released("ui_up") and is_on_floor():
		cargando = false
		$saltogrande.stop()
		if saltolisto:
			velocidad.y = -400
		
		
	if Input. is_action_pressed("ui_right"):
		dashder = true
		
	if Input. is_action_just_released("ui_right"):
		dashder = false
		
	if Input. is_action_just_pressed("ui_select"):
		if dashder:
			velocidad.x += veldash
			$Dash.start()
	
	if Input. is_action_pressed("ui_left"):
		dashizq = true
		
	if Input. is_action_just_released("ui_left"):
		dashizq = false
		
	if Input. is_action_just_pressed("ui_select"):
		if dashizq:
			velocidad.x -= veldash
			$Dash.start()
	
	
	if Input. is_action_just_pressed("ui_down"):
		if golpe:
			$AnimatedSprite.play("golpe")
			$Timerdash.start()
			$velgolpe.start()
			golpe = false
	pass
func _on_Timerdash_timeout():
	$AnimatedSprite.play("default")
	
	pass 


func _on_Dash_timeout():
	velocidad.x =0
	pass # Replace with function body.


func _on_velgolpe_timeout():
	golpe = true
	pass # Replace with function body.

func _on_saltogrande_timeout():
	saltolisto = true
	
	pass # Replace with function body.
