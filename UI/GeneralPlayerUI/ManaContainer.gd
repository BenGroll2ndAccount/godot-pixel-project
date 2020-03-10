extends Node2D

export (int) var active = false

func deactivate():
	if active:
		$AnimationPlayer.play("fill")
		active = false
	else:
		$Sprite.frame = 4
		
func activate():
	if active:
		$Sprite.frame = 0
	else:
		$AnimationPlayer.play_backwards("fill")
		active = true

func kill():
	if active:
		$AnimationPlayer.play("fill")
		yield($AnimationPlayer, "animation_finished")
		$AnimationPlayer.play("die")
		yield($AnimationPlayer, "animation_finished")
		queue_free()
	else:
		$AnimationPlayer.play("die")
		yield($AnimationPlayer, "animation_finished")
		queue_free()
