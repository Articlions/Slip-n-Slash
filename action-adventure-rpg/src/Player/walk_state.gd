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
	pass
	# animation_tree.set_active(true)

func _physics_update(delta: float):
	
	var character = state_machine.get_parent()
	
	# var direction := Input.get_axis("action_left", "action_right")
	
	direction_vector = Input.get_vector("action_left","action_right", "action_up","action_down")
	
	
	
	if Input.is_action_just_pressed("action_attack_1"):
		state_machine.change_state("attack1state")
		animation_tree.set("parameters/StateMachine/WalkState/AttackState/BlendSpace2D/blend_position", direction_vector)
		return
		
		# yeah i see what i did FACE SLAP!
	
	if direction_vector != Vector2.ZERO:
		negative_vector = Vector2(direction_vector.x, -direction_vector.y)
		animation_tree.set("parameters/StateMachine/WalkState/RunState/blend_position", negative_vector)

	


		

	
	
	
	if direction_vector == Vector2.ZERO:
		ssplayer.velocity = ssplayer.velocity.move_toward(Vector2.ZERO, delta * FRICTION)
		animation_tree.set("parameters/StateMachine/WalkState/IdleState/blend_position", negative_vector)
		# quick fix to make it eaiser invert it via code!
		state_machine.change_state("idlestate")
		return
		
		
		

		
	ssplayer.velocity = direction_vector * SPEED


	
	ssplayer.move_and_slide()
	
	
	
