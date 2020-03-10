extends CanvasLayer
var inventory_access = false 
var inventory_open = false
var pausemenu_open = false
var general_ui_enabled = false


func _process(delta):
	if general_ui_enabled == true:
		GeneralPlayerUI.show()
	else:
		GeneralPlayerUI.hide()
	
	if Input.is_action_just_pressed("ui_cancel"):
		if not inventory_open && not pausemenu_open:
			pausemenu_open = true
			var pausemenu = preload("res://UI/Menus/PauseGameMenu/PauseGameMenu.tscn").instance()
			add_child(pausemenu)
			get_tree().paused = true
	if Input.is_action_just_pressed("ui_focus_next"):
		if inventory_access:
			if not inventory_open:
				general_ui_enabled = false
				var inventory = preload("res://UI/Inventory/Inventory.tscn").instance()
				add_child(inventory)


func change_scene_no_fade(scene_to, spawnpoint = "standard"):
	get_tree().paused = true
	get_tree().get_root().get_children()[get_tree().get_root().get_child_count() -1].queue_free()
	var new_scene_root = load(scene_to)
	var new_scene = new_scene_root.new()
	get_tree().get_root().add_child(new_scene)
	get_tree().current_scene = new_scene
	get_tree().paused = false
	
func change_scene_fade(scene_to, fade_speed = 1, spawnpoint = "standard"):
	general_ui_enabled = false
	inventory_access = false
	get_tree().paused = true
	$Anim.play("fade")
	yield($Anim, "animation_finished")
	get_tree().get_root().get_children()[get_tree().get_root().get_child_count() -1].queue_free()
	var new_scene_root = load(scene_to)
	var new_scene = new_scene_root.instance()
	new_scene.init(spawnpoint)
	get_tree().get_root().add_child(new_scene)
	get_tree().current_scene = new_scene
	$Anim.play_backwards("fade")
	yield($Anim, "animation_finished")
	get_tree().paused = false
	inventory_access = true
	general_ui_enabled = true
