extends Light2D


func _ready():
	SystemTimeManagement.connect("time_changed", self, "_on_time_change")
	if SystemTimeManagement.time_in_ticks > 72110 || SystemTimeManagement.time_in_ticks < 12400:
		energy = 1.2
	
func _on_time_change():
	if SystemTimeManagement.time_in_ticks == 72000:
		var delay = randi() % 10 + 100
		yield(get_tree().create_timer(delay), "timeout")
		Tween.light_on()
	
		
		
