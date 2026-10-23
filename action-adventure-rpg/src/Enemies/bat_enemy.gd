extends CharacterBody2D


@export_category("bat-stats")
@export var health_points: int = 150

func take_damage(damage_amount: int) -> void: 
	health_points -= damage_amount
	if health_points <= 0:
		death()
		
		
func death() -> void:
	queue_free()
