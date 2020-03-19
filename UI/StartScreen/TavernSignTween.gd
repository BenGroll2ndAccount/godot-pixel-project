extends Tween
func _process(delta):
	if Input.is_action_just_pressed("A"):
		lights_on()

func lights_on():
		interpolate_property(get_parent(), "energy", 0, 1, 0.8, Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
		start()
