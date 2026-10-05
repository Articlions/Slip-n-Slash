extends State

class_name WalkState

const SPEED := 300.0

@export var FRICTION: float = 200
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"


	
	
		

func _physics_update(delta: float):
	
	var character = state_machine.get_parent()
	
	var direction := Input.get_axis("action_left", "action_right")
	
	var direction_vector:= Input.get_vector("action_left","action_right", "action_up","action_down")
	
	
	if direction_vector == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
		
	elif direction_vector == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")

	
	
	
	if direction == 0:
		move_toward(character.velocity.x, 0, delta * FRICTION)
		state_machine.change_state("idledownstate")
		return
		
		
	character.velocity.x = direction * SPEED
	
	character.move_and_slide()
	
	
	
