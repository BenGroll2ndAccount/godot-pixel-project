extends KinematicBody2D
export (bool) var RandomMovement
var movedirection 

func hurt():
	$StalfosSprite.texture = load("res://_entities/_hostile/Stalfos_hurt.png")
	yield(get_tree().create_timer(0.2), "timeout")
	$StalfosSprite.texture = load("res://_entities/_hostile/Stalfos.png")
	
func _physics_process(delta):
	pass