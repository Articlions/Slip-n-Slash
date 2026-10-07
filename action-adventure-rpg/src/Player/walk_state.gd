extends State

class_name WalkState

@export var SPEED: float = 300.0

@export var FRICTION: float = 200

@export var ACCELERATION: float = 700


@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"


	
	
		

func _physics_update(delta: float):
	
	var character = state_machine.get_parent()
	
	# var direction := Input.get_axis("action_left", "action_right")
	
	var direction_vector: Vector2 = Input.get_vector("action_left","action_right", "action_up","action_down")
	
	
	if direction_vector == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
		
	elif direction_vector == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
		
	elif direction_vector == Vector2.UP:
		animated_sprite_2d.play("walk_up")
		
	elif direction_vector == Vector2.DOWN:
		animated_sprite_2d.play("walk_down")
		

		

	
	
	
	if direction_vector == Vector2.ZERO:
		character.velocity = character.velocity.move_toward(Vector2.ZERO, delta * FRICTION)
		state_machine.change_state("idledownstate")
		return
		
		
	character.velocity = direction_vector * SPEED


	
	character.move_and_slide()
	
	
	
