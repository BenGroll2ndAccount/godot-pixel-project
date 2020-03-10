extends Control


func _ready():
	$StartgameButton.connect("button_down", self, "_on_started")
	
func _on_started():
	get_tree().change_scene($StartgameButton.get("StartScenepath"))