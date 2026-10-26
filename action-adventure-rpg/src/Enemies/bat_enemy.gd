extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export_category("bat-stats")
@export var health_points: int = 150

func _ready() -> void:
	animation_player.play("idle")

func take_damage(damage_amount: int) -> void: 
	health_points -= damage_amount
	print("Damage Taken Health: ",  health_points)
	if health_points <= 0:
		death()

		
		
func death() -> void:
	animation_player.play("death")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death": 
		queue_free()


		
