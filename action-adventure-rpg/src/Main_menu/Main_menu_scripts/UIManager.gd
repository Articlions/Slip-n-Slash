extends Control

@onready var singleplayer_button: Button = $Panel/VBoxContainer/Singleplayer_Button

@onready var quit_button: Button = $Panel/VBoxContainer/Quit_Button
@onready var multiplayer_button: Button = $Panel/VBoxContainer/Multiplayer_Button







# Called when the node enters the scene tre---OK ITS MY TURN NOW!!!!!!!!
func _ready() -> void:
	singleplayer_button.pressed.connect(_on_singleplayer_button_pressed) # first time i connected through Code!
	quit_button.pressed.connect(_on_quit_button_pressed) # and then we do it again yeah!
	
	if OS.has_feature("linux"):
		multiplayer_button.disabled = true
		multiplayer_button.hide()
		
	if OS.has_feature("android"):
		quit_button.disabled = true
		quit_button.hide()
	
func _on_singleplayer_button_pressed():
	get_tree().change_scene_to_file("res://src/Game/level1/level1.tscn")
	
func _on_quit_button_pressed():
	get_tree().quit()
