extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.has_feature("linux") or OS.has_feature("web") or OS.has_feature("windows"):
		self.PROCESS_MODE_DISABLED
		self.hide()
		


func _on_button_pressed() -> void:
	Eventmanager.pause_pressed.emit()
