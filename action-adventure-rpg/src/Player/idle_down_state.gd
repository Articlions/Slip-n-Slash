extends State

class_name IdleDownState
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"



func enter_state():
	animated_sprite_2d.play("idle_down")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
