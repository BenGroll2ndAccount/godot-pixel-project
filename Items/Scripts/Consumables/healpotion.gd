extends Node



#### ------- DONT CHANGE ------- ####
var childs = []
var mode
func _process(delta):
	if Input.is_action_just_pressed("Left_Mouse"):
		if mode == "left":
			use()
	if Input.is_action_just_pressed("Right_Mouse"):
		if mode == "right":
			use()


func configure(side):
	if side == "right":
		mode = "right"
	else:
		mode = "left"
		
func unequip():
	for child in childs:
		queue_free()
	queue_free()
		
		
#### ------- Change From Here ------- ####
func use():
	var particles = preload("res://ParticleSystems/HealpotHealEffect.tscn").instance()
	GeneralPlayerUI.Player.add_child(particles)
	GeneralPlayerUI.heal(100)
	Items.waste_item(mode)
	unequip()
