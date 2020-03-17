extends Sprite

func _ready():
	$Area2D.connect("mouse_entered", self, "hover")
	$Area2D.connect("mouse_exited", self, "dehover")
	
	
func hover():
	$AnimationPlayer.play("bubble")
	
func dehover():
	$AnimationPlayer.stop()
