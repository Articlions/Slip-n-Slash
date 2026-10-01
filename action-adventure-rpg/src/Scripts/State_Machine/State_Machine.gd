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
		


func _process(delta: float) -> void:
	pass
	


func _physics_process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	pass
	
func change_state(next_state_name: State) -> void:
	pass
