class_name State_Blueprint extends Node

# ok so this supposedly stores the reference to the player script 
# almost like with my game engine when i made compoents 
# like this public Actor Parent { get; set;} 
# I know i just casually dropped C#!

static var player: SSPlayer

func _ready() -> void:
	pass # Replace with function body.


# This is called when the SSPlayer enters the state
func Enter_state() -> void:
	pass
	


# This is called when the SSplayer Exits the state
func Exit_state() -> void:
	pass
	

# Pretty much the update function
func Process(delta: float) -> State_Blueprint:
	return null


# Update but for the Physics code
func Physics_process(delta: float) -> State_Blueprint:
	return null
	
	
# For the input events with this state that we are in
func Handle_input(event: InputEvent) -> State_Blueprint:
	return null
	
	
