extends Button

func _ready():
	connect("button_down", self, "button_down")
	connect("mouse_entered", self, "hover")
	connect("mouse_exited", self, "dehover")
	get_tree().paused = true
	
func button_down():
	get_tree().paused = false
	SceneSwitcher.pausemenu_open = false
	get_parent().get_parent().get_parent().get_parent().queue_free()
	
func hover():
	get_parent().get_node("AnimationPlayer").play("get_big")
	
func dehover():
	get_parent().get_node("AnimationPlayer").play_backwards("get_big")
