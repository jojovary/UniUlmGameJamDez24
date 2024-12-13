extends CharacterBody2D

var ground = true
var speed = 50.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
enum state {WALKING,FLYING,FALLING}
var currentState = state.WALKING

func _physics_process(delta):
	
	if currentState == state.WALKING:
		miseryInCage(delta)
	if currentState == state.FLYING:
		pass
	if currentState == state.FALLING:
		pass
	
	directionFlip()
	move_and_slide()


func miseryInCage(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if !$GroundDetector.is_colliding():
		speed = speed * -1
		scale.x = abs(scale.x) * -1
	velocity.x = speed


func directionFlip():
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		
