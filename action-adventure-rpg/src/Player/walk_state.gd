extends State

class_name WalkState


# -----------Variables------------
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var animation_tree: AnimationTree = $"../../AnimationTree"


# -----------Variables Not onready--------
@export_category("Player-Stats")
@export var SPEED: float = 300.0
@export var FRICTION: float = 200
@export var ACCELERATION: float = 700
var direction_vector := Vector2.ZERO
var negative_vector


	
func enter_state():
	animation_tree.set_active(true)

func _physics_update(delta: float):
	
	var character = state_machine.get_parent()
	
	# var direction := Input.get_axis("action_left", "action_right")
	
	direction_vector = Input.get_vector("action_left","action_right", "action_up","action_down")
	
	if direction_vector != Vector2.ZERO:
		negative_vector = Vector2(direction_vector.x, -direction_vector.y)
		animation_tree.set("parameters/StateMachine/WalkState/RunState/blend_position", negative_vector)

	
	
	# if direction_vector == Vector2.RIGHT:
		animation_player.play("run_right")
	# elif direction_vector == Vector2.LEFT:
		animation_player.play("run_left")
	# elif direction_vector == Vector2.UP:
		animation_player.play("run_up")
	# elif direction_vector == Vector2.DOWN:
		animation_player.play("run_down") 

		

	
	
	
	if direction_vector == Vector2.ZERO:
		ssplayer.velocity = ssplayer.velocity.move_toward(Vector2.ZERO, delta * FRICTION)
		animation_tree.set("parameters/StateMachine/WalkState/IdleState/blend_position", negative_vector)
		state_machine.change_state("idlestate")
		return
		
		
	ssplayer.velocity = direction_vector * SPEED


	
	ssplayer.move_and_slide()
	
	
	
