extends CharacterBody2D

enum States {
	IDLE,
	WALK,
	ATTACK,
	RETURN,
	DEAD
	
}
# -------Exports!-----------------
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export_category("bat-stats")
@export var health_points: int = 150
@export var current_state: States = States.IDLE
@export var speed: int = 300
@export var attack_damage: int = 15
@export var aggro_range: float = 256.0
@export var attack_range: float = 80.0
@export var attack_speed: float = 1.0

# --------------Onreadies!-------------
@onready var spawn_point: Vector2 = global_position
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Players")
@onready var player_sprite: AnimatedSprite2D = player.get_node("AnimatedSprite2D")
@onready var player_detection_2D: Marker2D = player.get_node("Detection2D")
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D



func _ready() -> void:
	animation_player.play("idle")
	
	
func _physics_process(delta: float) -> void:

	if current_state == States.DEAD:
		return
	if current_state == States.ATTACK:
		return
	var distance = distance_to_player()
	# print("Distance: ", distance)
	# print("Attack Range: ", attack_range)
	# print("Distance: ", distance, " | State: ", current_state)

	if distance <= attack_range:
		current_state = States.ATTACK
		print("Im gonna get you")
		enemy_attack()
		
	elif distance_to_player() <= aggro_range:
		current_state = States.WALK
		enemy_walk()
	elif global_position.distance_to(spawn_point) > 32:
		current_state = States.RETURN
		enemy_walk() 
		
	elif current_state != States.IDLE:
		current_state = States.IDLE
		update_enemy_animations()
	
	
 # I DID NOT realize that the enemy was just another player
func distance_to_player() -> float:
	# print("BAT ROOT: ", global_position)
	# print("PLAYER ROOT: ", player.global_position)
	# print("PLAYER SPRITE: ", player_sprite.global_position)
	return global_position.distance_to(player_detection_2D.global_position)
	
	
func enemy_walk():
	pass
	
	
	
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	navigation_agent_2d.velocity = safe_velocity
func enemy_attack():
	update_enemy_animations()
	await get_tree().create_timer(attack_speed).timeout
	if current_state == States.DEAD:
		return
	
	current_state = States.IDLE
	
	
func update_enemy_animations():
	match current_state:
		States.IDLE:
			animation_player.play("idle")
		States.WALK:
			animation_player.play("flying")
		States.RETURN:
			animation_player.play("flying")
		States.ATTACK:
			animation_player.play("attack")
	
	
	

func take_damage(damage_amount: int) -> void: 
	if current_state == States.DEAD:
		return 
	
	
	health_points -= damage_amount
	print("Damage Taken Health: ",  health_points)
	if health_points <= 0:
		death()

		
		
func death() -> void:
	if current_state == States.DEAD:
		return 
	
	
	current_state = States.DEAD
	animation_player.play("death")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death": 
		queue_free()


func _on_hit_box_area_entered(area: Area2D) -> void:
	area.owner.take_damage(attack_damage)
	pass
