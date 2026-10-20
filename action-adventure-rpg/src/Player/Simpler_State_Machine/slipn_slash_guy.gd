class_name SSPlayer extends CharacterBody2D
# this extends or inherits the obvious




# tje node based state machine is ANNOYING so im trying something different 
enum States {
	IDLE,
	WALK,
	ATTACK
	
}


# THE GLORIOUS VARIABLES!!!!
# -----------Variables------------
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@onready var animation_tree: AnimationTree = $AnimationTree

var animation_playback: AnimationNodeStateMachinePlayback 


# -----------Variables Not onready--------
@export_category("Player-Stats")
@export var SPEED: float = 300.0
@export var FRICTION: float = 200
@export var ACCELERATION: float = 700
@export var current_state: States = States.IDLE



# -------------Varibles not Exported hahahaha------------
var direction_vector := Vector2.ZERO
var negative_vector: Vector2
var walk_direction: Vector2 



 # in ready i meade sure to set the inital animation and the playback!
func _ready() -> void:
	animation_playback = animation_tree.get("parameters/StateMachine/WalkState/playback")
	animation_playback.travel("IdleState")



	
	
# basically changes the state WHEEEEEEEE but also then manages animations 
func change_state(new_state: States):
	current_state = new_state
	
	if current_state == States.ATTACK:
		animation_playback.travel("AttackState")
		# 5, 4, 3, 2, 1, !
		await get_tree().create_timer(0.5).timeout
		
		if direction_vector != Vector2.ZERO:
			change_state(States.WALK)
		elif direction_vector == Vector2.ZERO:
			change_state(States.IDLE)


	elif current_state == States.WALK:
		animation_playback.travel("RunState")
	
	elif current_state == States.IDLE:
		animation_playback.travel("IdleState")

		


func _physics_process(delta: float) -> void:
	# needed for rpgsvs get_axis fun fact!
	direction_vector = Input.get_vector("action_left","action_right", "action_up","action_down")
	
	if Input.is_action_just_pressed("action_attack_1") and current_state != States.ATTACK:
		# debug stuff print("We are kicking butt!")
		change_state(States.ATTACK)
		
	negative_vector = Vector2(direction_vector.x, -direction_vector.y)
	
	# set those burgers on the grill!!!!!
	animation_tree.set("parameters/StateMachine/WalkState/AttackState/BlendSpace2D/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/WalkState/RunState/blend_position", negative_vector)
	animation_tree.set("parameters/StateMachine/WalkState/IdleState/blend_position", negative_vector)
	
	# I MISS SWITCH/CASE :(
	match current_state:
		States.IDLE: 
			idle_process()
		States.WALK:
			walk_process()
		States.ATTACK: 
			attack_process()
			
	move_and_slide()
	

func idle_process():
	
	velocity = Vector2.ZERO
	
	# A stack of routers to walk process 
	if Input.is_action_pressed("action_left"):
		change_state(States.WALK)
	elif Input.is_action_pressed("action_right"):
		change_state(States.WALK)
	elif Input.is_action_pressed("action_down"):
		change_state(States.WALK)
	elif Input.is_action_pressed("action_up"):
		change_state(States.WALK)

	
func walk_process():
	walk_direction = direction_vector.normalized()
	if direction_vector != Vector2.ZERO:
		velocity = walk_direction * SPEED
		
	else: 
		change_state(States.IDLE)
	
	

	
	

func attack_process():
	velocity = Vector2.ZERO
	
	
	
	
