extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	move_player()
	activate_beam()

func move_player():
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func activate_beam():
	if !Input.is_action_pressed("ActivateBeam"):
		$Beam.scale.y = 0
		return
	
	$Beam.scale.y = 1

func _on_beam_body_entered(body: Node2D) -> void:
	if body.is_in_group("humans"):
		# state change
		pass
