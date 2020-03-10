extends Button
var savemenu 

func _ready():
	connect("button_down", self, "_down")
	
	
func _down():
	get_parent().get_parent().get_parent().get_parent().get_parent().hide()
	var saveMenu = preload("res://UI/Menus/SaveGameMenu/SaveGameMenu.tscn").instance()
	get_tree().get_root().add_child(saveMenu)
	savemenu = saveMenu
	saveMenu.show()
	

		
	
