extends State

class_name WalkState

const SPEED = 300.0


func _physics_update(delta: float):
	
	var character = state_machine.get_parent()
	
	var direction := Input.get_axis("action_left", "action_right")
	print("Walking: " ,direction)

	
	
	
	if direction == 0:
		state_machine.change_state("idledownstate")
		return
		
		
	character.velocity.x = direction * SPEED
	
	character.move_and_slide()
	
	
	
