class_name PauseMenu extends CanvasLayer

@onready var pause_menu: CanvasLayer = $"."



func pause_episode():
	get_tree().paused = true
	pause_menu.show()
	
func resume_episode():
	get_tree().paused = false
	pause_menu.hide()




func _on_return_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://src/Main_menu/Main_menu.tscn")
	
	
func pause_pressed():
	if Input.is_action_just_pressed("action_pause") and get_tree().paused == false:
		pause_episode()


func _on_resume_button_pressed() -> void:
	resume_episode()
	
	
	

	
	

	
	
func _process(delta: float) -> void:
	pause_pressed()
