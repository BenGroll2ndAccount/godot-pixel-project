extends MarginContainer
var slots = []

func _ready():
	SceneSwitcher.inventory_open = true
	get_tree().paused = true
	get_tree().call_group("InvNormalSlot", "register")
	SceneSwitcher.inventory_open = true

	
	$InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotLeft.insert(Items.inventory_space[18])
	$InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotRight.insert(Items.inventory_space[19])
	
func register_slot(slot):
	slots.append(slot)
	if slots.size() == 18:
		for slotnumber in slots.size() - 1:
			slots[slotnumber].insert(Items.inventory_space[slotnumber])
	
			
			
			
func insert_item(slot, item):
	slot.insert(item)
	
func update_slotspace(slot, item_name):
	for slotnumber in slots.size():
		if slots[slotnumber] == slot:
			Items.inventory_space[slotnumber] = item_name

func update_selection(slot, item):
	if slot == "q":
		$InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotLeft.insert(item)
		Items.inventory_space[18] = item
	else:
		$InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotRight.insert(item)
		Items.inventory_space[19] = item



func _process(delta):
	if  Input.is_action_just_pressed("ui_focus_next"):
		Items.equip_item("left", Items.inventory_space[18])
		Items.equip_item("right", Items.inventory_space[19])
		SceneSwitcher.inventory_open = false
		SceneSwitcher.general_ui_enabled = true
		get_tree().paused = false
		self.queue_free()
		
