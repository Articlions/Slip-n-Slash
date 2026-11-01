extends CanvasLayer

# why did i do this????? whatever yes i know that the batenemy
# isnt that well commented but i genuiely had to figure out how to learn 
# it all so i wasnt really had time to do the comments
# anyways!

@onready var time_label: Label = $HUDControl/TimeLabel
var time = Time.get_time_string_from_system(true)


func _ready() -> void:
	time_label.text = time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
