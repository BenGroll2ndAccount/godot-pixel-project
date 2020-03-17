extends CanvasLayer

onready var ColorRec = get_node("ColorRect")
var factor_r
var factor_g
var factor_b

func _process(delta):
	if SystemTimeManagement.time_in_ticks > 0.0 && SystemTimeManagement.time_in_ticks < 43200.0:
		ColorRec.color.r8 = ((SystemTimeManagement.time_in_ticks / 432)) * 1.3
		ColorRec.color.g8 = (pow((SystemTimeManagement.time_in_ticks / 21600), 2)) / 2.1 * 100 * 1.3
		ColorRec.color.b8 = 2 * (SystemTimeManagement.time_in_ticks / 432) * 1.3
	else:
		ColorRec.color.r8 = (( (83999 - SystemTimeManagement.time_in_ticks) / 432)) * 1.3
		ColorRec.color.g8 = (pow(((83999 - SystemTimeManagement.time_in_ticks) / 21600), 2)) / 2.1 * 100 * 1.3
		ColorRec.color.b8 = 2 * ((83999 - SystemTimeManagement.time_in_ticks) / 432) * 1.3





