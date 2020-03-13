extends CanvasLayer


func start():
	$Tween.interpolate_property($DialogueBackground, "offset", Vector2(0, 170), Vector2(0, 0), 1, Tween.TRANS_QUART, Tween.EASE_IN_OUT)
	$Tween.start()
	$
