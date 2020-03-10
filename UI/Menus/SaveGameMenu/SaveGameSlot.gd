extends MarginContainer

export (int) var SlotNumber

var hovered

func _process(delta):
	if Input.is_action_just_pressed("Left_Mouse"):
		if hovered:
			SaveLoadVariables.save_all(SlotNumber, self)
	if Input.is_action_just_pressed("Right_Mouse"):
		if hovered:
			SaveLoadVariables.save_all(SlotNumber, self)
			
	if Input.is_action_just_pressed("X"):
		if hovered:
			SaveLoadVariables.delete_slot(SlotNumber, self)
			
			

func test():
	var test_file = File.new()
	if not test_file.file_exists(str("user://godot_saves/" + self.name + "_preview.save")):
		mark_not_exist()
	else:
		test_file.open("user://godot_saves/" + self.name + "_preview.save", File.READ)
		var current_line = parse_json(test_file.get_line())
		var data = current_line
		$Labels/CurrentPositionLabel.text = str(data["pos"])
		$Labels/TotalPlaytimeLabel.text = str(data["playtime"])
		$Labels/StatusLabel.text = "Game Data successfully detected."
			
					
			
				
func mark_not_exist():
	$Labels/StatusLabel.text = "No saved game detected."
	$Labels/CurrentPositionLabel.text = "No position data detected."
	$Labels/TotalPlaytimeLabel.text = "00hrs 00min 00sec"

func _ready():
	connect("mouse_entered", self, "hover")
	connect("mouse_exited", self, "dehover")

func hover():
	hovered = true

func dehover():
	hovered = false
