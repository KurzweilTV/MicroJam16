extends CharacterBody2D

@export var speed = 100  # Speed at which the enemy moves toward the player

@export var player: Node2D = null  # Reference to the player node

func _ready():
	if player == null:
		print("Failed to instantiate player.")

func _physics_process(delta):
	if player:
		move_toward_player(delta)

func move_toward_player(delta):
	# Calculate the direction vector towards the player
	var direction = (player.global_position - global_position).normalized()
	
	# Update velocity to move in the direction of the player
	velocity = direction * speed
	
	# Move the enemy towards the player
	move_and_slide()
	
	# Rotate the enemy to face the player
	rotation = direction.angle()
