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
@onready var animation_tree: AnimationTree = $"../../AnimationTree"
var animation_playback: AnimationNodeStateMachinePlayback = $AnimationTree["parameters/StateMachine/WalkState/playback"]


# -----------Variables Not onready--------
@export_category("Player-Stats")
@export var SPEED: float = 300.0
@export var FRICTION: float = 200
@export var ACCELERATION: float = 700


# -------------Varibles not Exported hahahaha------------
var direction_vector := Vector2.ZERO
var negative_vector: Vector2
var current_state := States.IDLE


func _physics_process(delta: float) -> void:
	direction_vector = Input.get_vector("action_left","action_right", "action_up","action_down")
	
	match current_state:
		States.IDLE: idle_process()
		States.WALK: walk_process()
		States.ATTACK: attack_process()
	

func idle_process():
	pass
	
func walk_process():
	pass
	

func attack_process():
	pass
	
	
	
	
	
	
	
	
	
