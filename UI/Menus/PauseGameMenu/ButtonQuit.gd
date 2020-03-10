
extends Button

func _ready():
	connect("button_down", self, "button_down")
	connect("mouse_entered", self, "hover")
	connect("mouse_exited", self, "dehover")
	
func button_down():
	get_tree().quit()
	
func hover():
	get_parent().get_node("AnimationPlayer").play("get_big")
	
func dehover():
	get_parent().get_node("AnimationPlayer").play_backwards("get_big")
