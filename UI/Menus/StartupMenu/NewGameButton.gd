extends Button

func _ready():
	connect("button_down",self, "_down")
	
func _down():
	SceneSwitcher.change_scene_fade("res://Areas/Testing/TestArea.tscn")