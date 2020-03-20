extends Node2D
var carried_item = ""
var origin_slot 
var following = false

	
func reset():
	carried_item = ""
	origin_slot = null
	following = false
	self.hide()
	
func _ready():
	reset()
	

func _process(delta):
	if following:
		self.position = get_global_mouse_position() + Vector2(10, 10)
	
func toggle(slot):
	if carried_item != "":
		drop(slot)
	else:
		if origin_slot == null:
			activate(slot, slot.item_name)
	
	
	
func activate(orig, item):
	if not orig.item_name == "":
		origin_slot = orig
		carried_item = item
		self.show()
		origin_slot.clear()
		$TextureRect.texture = Items.get_icon(item)
		$TextureRect.normal_map = Items.get_normal(item)
		following = true
	
func drop(slot):
		var newItem = slot.item_name
		slot.insert(carried_item)
		if slot == origin_slot:
			pass
		else:
			origin_slot.insert(newItem)
		reset()

	
