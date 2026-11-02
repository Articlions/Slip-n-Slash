extends CanvasLayer

# why did i do this????? whatever yes i know that the batenemy
# isnt that well commented but i genuiely had to figure out how to learn 
# it all so i wasnt really had time to do the comments
# anyways!

@onready var time_label: Label = $HUDControl/TimeLabel


func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_time = Time.get_time_dict_from_system()
	
	var time_nowformatted: String = "%02d:%02d:%02d" % [current_time.hour, current_time.minute, current_time.second]
	time_label.text = time_nowformatted


	pass
