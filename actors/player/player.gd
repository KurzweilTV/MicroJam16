extends CharacterBody2D

@export var speed = 120

@onready var exhaust: CPUParticles2D = $ExhaustParticles

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_direction != Vector2.ZERO:
		velocity = input_direction * speed
		rotation = velocity.angle()
		exhaust.emitting = true
	else:
		velocity = Vector2.ZERO
		exhaust.emitting = false

func _physics_process(_delta):
	get_input()
	move_and_slide()
