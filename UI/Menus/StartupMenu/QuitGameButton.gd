extends Button

func _ready():
	connect("button_down", self, "_down")
	
func _down():
	get_tree().quit()
