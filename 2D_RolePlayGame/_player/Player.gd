extends KinematicBody2D

var damage = 5

export (int) var speed
func switch_anim(dir, mode):
	$MoveAnim.play(str(mode, "_", dir))
	
func _process(delta):
	$MoveAnim.playback_speed = speed / 100
	
		
func hurt():
	$PlayerSprite.texture = load("res://_player/Player_hurt.png")
	yield(get_tree().create_timer(.2), "timeout")
	$PlayerSprite.texture = load("res://_player/Player.png")