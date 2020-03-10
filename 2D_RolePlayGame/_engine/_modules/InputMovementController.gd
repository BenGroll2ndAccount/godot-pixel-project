extends Node
onready var parent = get_parent()
export ( bool ) var on
var par_moving = false
var last_dir : String
var last_mode : String

func _process(delta):
	if on:
		if Input.is_action_pressed("w") or Input.is_action_pressed("a") or Input.is_action_pressed("d") or Input.is_action_pressed("s"):
			par_moving = true
			if Input.is_action_pressed("w") and not Input.is_action_pressed("a") and not Input.is_action_pressed("d") and not Input.is_action_pressed("s"):
				parent.move_and_slide(Vector2(0, -1) * parent.speed)
				anim_switch("up")
			
			if Input.is_action_pressed("a") and not Input.is_action_pressed("w") and not Input.is_action_pressed("d") and not Input.is_action_pressed("s"):
				parent.move_and_slide(Vector2(-1, 0) * parent.speed)
				anim_switch("left")
			
			if Input.is_action_pressed("s") and not Input.is_action_pressed("a") and not Input.is_action_pressed("d") and not Input.is_action_pressed("w"):
				parent.move_and_slide(Vector2(0, 1) * parent.speed)
				anim_switch("down")
			if Input.is_action_pressed("d") and not Input.is_action_pressed("a") and not Input.is_action_pressed("w") and not Input.is_action_pressed("s"):
				parent.move_and_slide(Vector2(1, 0) * parent.speed)
				anim_switch("right")
			if Input.is_action_pressed("w") and Input.is_action_pressed("a"):
				parent.move_and_slide(Vector2(-0.7, -0.7) * parent.speed)
				anim_switch("left")
			if Input.is_action_pressed("a") and Input.is_action_pressed("s"):
				parent.move_and_slide(Vector2(-0.7, 0.7) * parent.speed)
				anim_switch("left")
			if Input.is_action_pressed("s") and Input.is_action_pressed("d"):
				parent.move_and_slide(Vector2(0.7, 0.7) * parent.speed)
				anim_switch("right")
			if Input.is_action_pressed("d") and Input.is_action_pressed("w"):
				parent.move_and_slide(Vector2(0.7, -0.7) * parent.speed)
				anim_switch("right")
				
			
			
			
			
		else:
			par_moving = false
			anim_switch("none")
		
		
func anim_switch(dir):
	var dir_move
	
	
	var move_mode
	if par_moving == false:
		move_mode = "idle"
	else:
		match dir:
			"up":
				dir_move = Vector2(0, -1)
			"down":
				dir_move = Vector2(0, 1)
			"right":
				dir_move = Vector2(1, 0)
			"left":
				dir_move = Vector2(-1, 0)
			
		if parent.is_on_wall():
			if parent.test_move(parent.transform, dir_move):
				move_mode = "push"
			else:
				move_mode = "walk"
		else:
			move_mode = "walk"
	if last_dir != dir or last_mode != move_mode:
		if dir != "none":
			parent.switch_anim(dir, move_mode)
			last_dir = dir
			last_mode = move_mode
		else:
			if last_dir != "":
				parent.switch_anim(last_dir, "idle")
				last_mode = "idle"
	
		
		