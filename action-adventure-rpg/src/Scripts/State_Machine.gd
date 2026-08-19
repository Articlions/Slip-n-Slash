class_name State_Machine extends Node


# State variables for our state machine
var state_collection: Array[ State_Blueprint ]
var previous_state: State_Blueprint
var current_state: State_Blueprint


func _ready() -> void:
	# Apparently this pauses the nodes from actually updating--I THINK
	process_mode = Node.PROCESS_MODE_DISABLED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func InitializeStateMachine() -> void:
	
	# init. the array
	state_collection = []
	
	# adds the states to the state machine
	for child_states in get_children():
		
		# checks to see and filter so only the nodes that are states
		# are actually added NO HICCUPS!!
		if child_states is State_Blueprint:
			# .append .add .push all the same to me
			state_collection.append(child_states)
	
	


# This changes the state to the new one
func Change_State(next_state: State_Blueprint) -> void:
	if next_state == null or next_state == current_state:
		return
	
	# calls the exit function
	if current_state:
		current_state.Exit_state()
		
	# last is equal to new
	previous_state = current_state
	
	# new is equal to parameters
	current_state = next_state
	
	# now we're calling the enter function
	current_state.Enter_state()
	
	
