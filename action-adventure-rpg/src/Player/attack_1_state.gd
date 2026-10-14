extends State
class_name Attack1State

func enter_state():
	pass
	
func exit_state():
	pass
	
	
func update_state(delta: float):
	ssplayer.velocity = Vector2.ZERO
	return null
	
func _physics_update(delta: float):
	return null
	
func _handle_input(event: InputEvent):
	return null
