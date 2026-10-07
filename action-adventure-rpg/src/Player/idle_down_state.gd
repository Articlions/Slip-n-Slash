extends State

class_name IdleDownState
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"


# THIS IS WHY STATE MACHINES WAS SON EXCTING FOR ME I CAN JUST DROP THIS IN HERE NO WORRIES ABOUT ORDERING!!!!
func enter_state():
	animated_sprite_2d.play("idle_down")
	
func _handle_input(event: InputEvent):
	if Input.is_action_pressed("action_left") or Input.is_action_pressed("action_right"):
		print("LEFT/RIGHT DETECTED")

		state_machine.change_state("walkstate")
		
	if Input.is_action_pressed("action_down") or Input.is_action_pressed("action_up"):
		state_machine.change_state("walkstate")
		
