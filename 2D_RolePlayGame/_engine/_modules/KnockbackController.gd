tool
extends Node

export (float) var weight 


func _get_configuration_warning():
	if get_parent().has_node("InputMovementController") :
		return ""
	else:
		if get_parent().has_node("RandomMovementController"):
			return ""
		else:
			return "No InputMovementController/RandomMovementController to use."

func knock(amount, area):
	var knockdir = get_parent().global_transform.origin - area.global_transform.origin
	print(knockdir.normalized())
	$KnockbackTween.interpolate_property(get_parent(), "position", get_parent().position, get_parent().position + knockdir.normalized() * amount * (1/((weight/100) + 0.000000000000001)), 0.02 * amount, Tween.TRANS_QUART, Tween.EASE_IN)
	if get_parent().has_node("InputMovementController"):
		get_parent().get_node("InputMovementController").on = false
	$KnockbackTween.start()
	yield($KnockbackTween, "tween_completed")
	yield(get_tree().create_timer(0.1), "timeout")
	if get_parent().has_node("InputMovementController"):
		get_parent().get_node("InputMovementController").on = true 