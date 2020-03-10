extends Node
onready var Player = get_parent()
onready var states = Player.get_node("Statemachine").get("parameters/playback")
var anim_state
func _ready():
	states.start("idle")
	anim_state = "idle"

func _process(delta):
	var movement = Vector2(0,0)
	if Input.is_action_pressed("W"):
		movement += Vector2(0, -80)
	if Input.is_action_pressed("A"):
		movement += Vector2(-80, 0)
	if Input.is_action_pressed("S"):
		movement += Vector2(0, 80)
	if Input.is_action_pressed("D"):
		movement += Vector2(80, 0)
		
		#Actual Movement
	if movement != Vector2(0,0):
		Player.move_and_slide(movement)
		
		#Animation
	var up	 	=	 movement.y < 0
	var left 	=	 movement.x < 0
	var down 	=	 movement.y > 0
	var right 	= 	 movement.x > 0
	
	if down && not anim_state == "walk_down":
		anim_state = "walk_down"
		states.travel("walk_down")
	if up && not anim_state == "walk up":
		anim_state = "walk_up"
		states.travel("walk_up")
	if left && not down && not up && not anim_state == "walk_left":
		anim_state = "walk_left"
		states.travel("walk_left")
	if right && not down && not up && not anim_state == "walk_right":
		anim_state = "walk_right"
		states.travel("walk_right")
	if !right && !left && !up && !down && not anim_state == "idle":
		anim_state = "idle"
		states.travel("idle")
		
			
		
		
