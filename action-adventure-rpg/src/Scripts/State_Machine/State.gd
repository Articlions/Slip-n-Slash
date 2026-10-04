extends Node

class_name State # Look I know im taking from a tutorial but For real its important

# WHOOOOOOOOOOOOO Ok state machine rewrite!!!!!!!!!
# Apprarently the physics_process() is a virtual method wow! cool welp im making my own

var state_machine: StateMachine


# SHOOOOOOOOT apperently this should hold a reference to its parent thats crazy 
# exactly like C# when i made a game engine in monogame


func enter_state():
	pass
	
	
func exit_state():
	pass

# Very self explainitory enter and exit state lol

func update_state(delta: float): # and the parameters obviously programmings greatest hits
	pass
	

func _physics_update(delta: float):
	pass
	
# this is for updating the state and all physics related stuff 

func _handle_input(event: InputEvent):
	pass
	
# and finally for handling Input 
# by the way more lore before now i tried to make an FPS failed but i learned more about handled_input and unhandled_input sorta
# dont ask me to explain the two haha
