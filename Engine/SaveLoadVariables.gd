extends Node

var save_variables = {
	char_spawn_position = Vector2(0, 0),
	spawn_scene = "",
	
	
	
	
	
}
var preview_data = {
	"pos"		: "null.",
	"playtime"	: "null."
		
}


func save_all(slotnumber, object):
	var saveUI = preload("res://UI/Menus/SaveDataScreen.tscn").instance()
	saveUI.get_node("CenterContainer/Sprite/AnimationPlayer").play("dreh")
	get_tree().get_root().add_child(saveUI)
	# Test if directory for the saves exists
	var test_directory = Directory.new()
	if not test_directory.dir_exists("user://godot_saves"):
		test_directory.make_dir("user://godot_saves")
		
	# Save the preview
	var save_preload = File.new()
	if save_preload.file_exists("user://godot_saves/SaveGame" + str(slotnumber) + "_preview.save"):
		var dir_pre = Directory.new()
		dir_pre.remove("user://godot_saves/SaveGame" + str(slotnumber) + "_preview.save")
	save_preload.open("user://godot_saves/SaveGame" + str(slotnumber) + "_preview.save", File.WRITE)
	save_preload.store_line(to_json(preview_data))
	save_preload.close()
		
	
	#Save the rest of the data
	var save_file = File.new()
	if save_file.file_exists("user://godot_saves/SaveGame" + str(slotnumber) + ".save"):
		var dir = Directory.new()
		dir.remove("user://godot_saves/SaveGame" + str(slotnumber) + ".save")
	save_file.open("user://godot_saves/SaveGame" + str(slotnumber) + ".save", File.WRITE)
	save_file.store_line(to_json(preview_data))
	save_file.close()
	yield(get_tree().create_timer(1), "timeout")
	saveUI.queue_free()
	object.test()
	
	
func delete_slot(slotnumber, object):
	var dir = Directory.new()
	var test_file = File.new()
	if test_file.file_exists("user://godot_saves/SaveGame" + str(slotnumber) + ".save"):
		dir.remove("user://godot_saves/SaveGame" + str(slotnumber) + ".save")
		if test_file.file_exists("user://godot_saves/SaveGame" + str(slotnumber) + "_preview.save"):
			dir.remove("user://godot_saves/SaveGame" + str(slotnumber) + "_preview.save")
			object.test()
	else:
		DebugConsole.out("No Data could be removed from slot " + str(slotnumber))


