extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%BackButton.pressed.connect(_on_back_button_pressed_because_user_does_not_want_to_see_how_to_play_any_more_and_wants_to_just_play_the_game)


func _on_back_button_pressed_because_user_does_not_want_to_see_how_to_play_any_more_and_wants_to_just_play_the_game() -> void:
	get_tree().change_scene_to_file("res://src/Main_menu/Main_menu.tscn")
