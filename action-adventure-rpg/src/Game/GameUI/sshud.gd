extends CanvasLayer

# why did i do this????? whatever yes i know that the batenemy
# isnt that well commented but i genuiely had to figure out how to learn 
# it all so i wasnt really had time to do the comments
# anyways!

@onready var time_label: Label = $HUDControl/TimeLabel # everytime i onready sometimes i get hit with
# null issues i have no idea why 

func _ready() -> void:
	Eventmanager.damaged.connect(_on_player_damaged_because_the_player_had_a_skill_issue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# var current_time = Time.get_time_dict_from_system()
	
	# ok maybe i googled why it wasnt working 
	# you know im starting to heavily dislike c strings this formatting is abolutelty stupid
	# var time_nowformatted: String = "%02d:%02d:%02d" % [current_time.hour, current_time.minute, current_time.second]
	# time_label.text = time_nowformatted # FINALLLY
	pass


# hahahahaahahahahahahahaha ok one of my greatest hits!
func _on_player_damaged_because_the_player_had_a_skill_issue(amount: int) -> void:
	%HealthPointsBar.value = amount
