extends State
class_name Attack1State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"



func enter_state():
	var animation_playback = animation_tree.get("parameters/StateMachine/WalkState/playback")
	animation_playback.travel("AttackState")

func exit_state():
	pass
	
	
func update_state(delta: float):
	ssplayer.velocity = Vector2.ZERO
	return null
	
func _physics_update(delta: float):
	return null
	
func _handle_input(event: InputEvent):
	return null
