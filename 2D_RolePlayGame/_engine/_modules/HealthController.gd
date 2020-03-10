extends Node

export (int) var maxHP
var current_HP

func _ready():
	current_HP = maxHP

func heal(amount):
	current_HP += amount
	print(current_HP)
	
func damage(amount):
	get_parent().hurt()
	current_HP -= amount
	print(current_HP)
	