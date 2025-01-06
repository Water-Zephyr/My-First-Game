extends AnimatedSprite2D

var speed = 200.0

func adjust_animation(direction: Vector2):
	if direction == Vector2.ZERO:
		animation = "idle"
	else:
		animation = "walk"
		
		if direction.x > 0:
			flip_h = false
		elif direction.x < 0:
			flip_h = true
	
	play()

func movement(delta: float):
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	direction = direction.normalized()
	
	position += speed * direction * delta
	
	adjust_animation(direction)

func _physics_process(delta: float) -> void:
	movement(delta)
