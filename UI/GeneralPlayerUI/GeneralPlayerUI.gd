extends CanvasLayer

const MANALIMIT = 40

var enabled
var Player

var player_vars = {
	max_mana = 15,
	current_mana = 5,
	
}

func _ready():
	_initiate()

func hide():
	if enabled != false:
		for child in get_children():
			child.hide()
			
	
func show():
	if enabled != true:
		for child in get_children():
			child.show()

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		_open_dialogue("1")
	
	if Items.inventory_space[18] != "":
		$SlotLeftBackground/ItemIcon.texture = Items.get_icon(str(Items.inventory_space[18]))
	else:
		$SlotLeftBackground/ItemIcon.texture = null
	if Items.inventory_space[19] != "":
		$SlotRightBackground/ItemIcon.texture = Items.get_icon(str(Items.inventory_space[19]))
	else:
		$SlotRightBackground/ItemIcon.texture = null

func _initiate():
	for child in $ManaSlots.get_children():
		child.queue_free()
	var slotcount = player_vars.max_mana
	var idx = 0
	while idx < slotcount:
		var NewSlot = preload("res://UI/GeneralPlayerUI/ManaContainer.tscn").instance()
		$ManaSlots.add_child(NewSlot)
		if idx < 10:
			NewSlot.position.y = $ManaSlots.global_position.y
			NewSlot.position.x = $ManaSlots.global_position.x + (idx * 19)
		elif idx < 20:
			NewSlot.position.y = $ManaSlots.global_position.y + 19
			NewSlot.position.x = $ManaSlots.global_position.x + (idx - 10) * 19
		elif idx < 30:
			NewSlot.position.y = $ManaSlots.global_position.y + 38
			NewSlot.position.x = $ManaSlots.global_position.x + (idx - 20) * 19
		elif idx < 40:
			NewSlot.position.y = $ManaSlots.global_position.y + 57
			NewSlot.position.x = $ManaSlots.global_position.x + (idx - 30) * 19

		if idx + 1 <= player_vars.current_mana:
			NewSlot.activate()
		idx += 1
		
func _remove_max_mana(amount):
	if player_vars.max_mana - amount < 0:
		return false
	player_vars.max_mana -= amount
	if player_vars.current_mana > player_vars.max_mana:
		player_vars.current_mana = player_vars.max_mana
	var idx = 0
	for child in $ManaSlots.get_children():
		if idx + 1 > player_vars.max_mana:
			child.kill()
		idx += 1
			
func _add_max_mana(amount):
	var count = player_vars.max_mana
	if player_vars.max_mana + amount >= MANALIMIT:
		amount = MANALIMIT - player_vars.max_mana
		player_vars.max_mana = MANALIMIT
	else:
		player_vars.max_mana += amount
	var idx = 0
	while idx < amount:
		var NewSlot = preload("res://UI/GeneralPlayerUI/ManaContainer.tscn").instance()
		$ManaSlots.add_child(NewSlot)
		if count + idx < 10:
			NewSlot.position.y = $ManaSlots.global_position.y
			NewSlot.position.x = $ManaSlots.global_position.x + ((idx + count) * 19)
			idx += 1
		elif count + idx < 20:
			NewSlot.position.y = $ManaSlots.global_position.y + 19
			NewSlot.position.x = $ManaSlots.global_position.x + ((idx + count) - 10) * 19
			idx += 1
		elif count + idx < 30:
			NewSlot.position.y = $ManaSlots.global_position.y + 38
			NewSlot.position.x = $ManaSlots.global_position.x + ((idx + count) - 20) * 19
			idx += 1
		elif count + idx < 40:
			NewSlot.position.y = $ManaSlots.global_position.y + 57
			NewSlot.position.x = $ManaSlots.global_position.x + ((idx + count) - 30) * 19
			idx += 1
		else:
			idx += 1
		
		
		
func _add_mana(amount):
	if player_vars.current_mana + amount > player_vars.max_mana:
		amount = player_vars.max_mana - player_vars.current_mana
		player_vars.current_mana = player_vars.max_mana
	else:
		player_vars.current_mana += amount
	var counter = 1
	for slot in $ManaSlots.get_children():
		if not slot.active:
			if counter <= amount:
				slot.activate()
				counter += 1
			else:
				break
	
				
func _remove_mana(amount):
	if player_vars.current_mana - amount < 0:
		return false
	else:
		var pos = player_vars.current_mana
		while pos > player_vars.current_mana - amount:
			$ManaSlots.get_child(pos - 1).deactivate()
			pos -= 1
		player_vars.current_mana -= amount
			
			
func heal(amount):
	#TODO
	pass
	
func _open_dialogue(id):
	get_tree().paused = true
	var dialogueBox = preload("res://UI/DialogueBox/DialogueBox.tscn").instance()
	get_tree().get_root().add_child(dialogueBox)
	
	
	
	
	
	
	
