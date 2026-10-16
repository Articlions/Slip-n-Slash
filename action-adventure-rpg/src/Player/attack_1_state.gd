extends State
class_name Attack1State


# not quite sure if global variables like this is a good idea  too many of them at least but
# have fun now suffer later!!!!!
@onready var animation_tree: AnimationTree = $"../../AnimationTree"
var direction_vector = Input.get_vector("action_left","action_right", "action_up","action_down")
var negative_vector := Vector2(direction_vector.x, -direction_vector.y)
var animation_playback 




# apperently actually explaining what this does is a bad idea beacause its self explainitory
func enter_state():
	animation_tree.animation_finished.connect(_on_animation_finished)
	animation_playback = animation_tree.get("parameters/StateMachine/WalkState/playback")
	animation_playback.travel("AttackState")
	
# haha thats funny exit is right after enter
func exit_state():
	animation_tree.animation_finished.disconnect(_on_animation_finished)
	
	
func update_state(delta: float):
	ssplayer.velocity = Vector2.ZERO
	return null
	
func _physics_update(delta: float):
	return null
	
func _handle_input(event: InputEvent):
	return null
	
	
func _on_animation_finished(anim_name: String):
	
	# Print debuggers
	
	# TODO: delete them
	print("Animation_fiinished: ",  anim_name)
	print("Inner animation state: ", animation_playback.get_current_node())
	
	# NEW SKILL!!!!!!!
	# match anim_name:
		# "attack1_down", "attack1_up", "attack1_left", "attack1_right":
			
	
	# now there is the if statement because this animation has been pretty much 
	# deteriorating my mental state
	
	if anim_name.begins_with("attack1_"):
		
		if direction_vector.length() > 0.0:
			animation_playback.travel("RunState")
			
		else:
			animation_playback.travel("IdleState")
		state_machine.change_state("walkstate")

		
		
		
		
		
		
		
		
		
		
		
	
	
	
	
	
	
