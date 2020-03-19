extends Node
signal time_changed

var time_in_ticks = 0
var timedict

func _ready():
	update_time()
	
	
func update_time():
	timedict = OS.get_time()
	time_in_ticks = ((timedict.hour * 60.0 * 60.0) + (timedict.minute * 60.0) + float(timedict.second))
	yield(get_tree().create_timer(1), "timeout")
	emit_signal("time_changed")
	update_time()
