extends CanvasLayer


func _ready():
	$Tween.interpolate_property($DialogueBoxBackground, "position", Vector2(320, 170), Vector2(320, 0), 1, Tween.TRANS_QUART, Tween.EASE_IN_OUT)
	$Tween.start()
