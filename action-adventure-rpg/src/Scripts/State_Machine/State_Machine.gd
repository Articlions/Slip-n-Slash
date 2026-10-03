extends Node

class_name StateMachine


@export var starting_state: State
var current_state: State
var states: Dictionary = {}


# virutal functions that the engine has built in
func _ready() -> void:
	# Perfect Now we have to get all the children states becasue this is node based
	# ok uhh
	for child in get_children(): # gets the children here
		if child is State:
			states[child.name.to_lower()] = child
			child.state_machine = self
			
	
	if starting_state:
		change_state(starting_state.name.to_lower())
		


# obviously the virtual funcs are called

func _process(delta: float) -> void:
	if current_state:
		current_state.update_state(delta)
	


func _physics_process(delta: float) -> void:
	if current_state:
		current_state._physics_update(delta)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state._handle_input(event)



# calls exit then makes the new state equal to the one in the paramenter then calls the enter function
func change_state(next_state_name: String) -> void:
	
	if current_state:
		current_state.exit_state()
		
		
	current_state = states.get(next_state_name.to_lower())
	
	
	if current_state:
		current_state.enter_state() 
