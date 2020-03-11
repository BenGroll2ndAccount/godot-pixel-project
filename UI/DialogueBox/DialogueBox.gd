extends CanvasLayer


func start(id):
	$AnimationPlayer.play("fade_in")
	yield($AnimationPlayer, "timeout")
	$DialogueBoxBackground/AuthorName = 
