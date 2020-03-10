extends Node
export (int) var speed
export (int) var moveframes
var movedirection
var movetimer
var on
func _ready():
	movedirection = new_move_rand()
	
	
func new_move_rand():
	var rand = randi() % 4
	var move_dir
	match rand:
		1:
			move_dir = Vector2(1, 0)
		2:
			move_dir = Vector2(-1, 0)
		3:
			move_dir = Vector2(0, 1)
		0:
			move_dir = Vector2(0, -1)
	return move_dir
	
	
func _physics_process(delta):
	on = get_parent().get("RandomMovement")
	if on:
		if movetimer == null:
			movetimer = moveframes
		else:
			if movetimer > 0:
				get_parent().move_and_slide(movedirection * speed)
		movetimer -= 1
		if movetimer == 0:
			movedirection = new_move_rand()
			movetimer = moveframes