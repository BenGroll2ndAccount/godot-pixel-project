extends Node
var scriptLeft
var itemLeft
var scriptRight
var itemRight

############### ------- Inventory Space ------- ############# ( "" = Empty Slot)
var inventory_space = [
"",   #1
"",   #2
"",   #3
"",   #4
"",   #5
"",   #6
"healpotion",   #7
"manapotion",   #8
"",   #9
"",   #10
"",   #11
"poisonbottle",   #12
"",   #13
"",   #14
"",   #15
"",   #16
"",   #17
"",   #18
"",   #Selection left-mouse
"",   #Selection right-mouse
]


################# ------- ITEM LIBRARY ------- ################
### Template Item-Entry ###
		#id = 1,
		#itemRealname = "Test Item",
		#icon = preload("res://Assets/ItemIcons/TestItems/Healpot.png"),
		#tooltip = "Potion commonly used for testing.",
		#equippable = true,
		#script = "res://Items/Scripts/testitem.gd",
		#nameColor = "",




var items = {
	### Consumables ###
	"healpotion" : 
	{
		id = 1,
		itemRealname = "Potion of Restoration",
		icon = preload("res://Assets/ItemIcons/Consumables/Healpot.png"),
		tooltip = "Potion that restores ... of your health when used. \nTastes like freshly picked mint.",
		equippable = true,
		script = "res://Items/Scripts/Consumables/healpotion.gd",
		nameColor = "red",
	},
	"manapotion" : 
	{
		id = 2,
		itemRealname = "Potion of Magic",
		icon = preload("res://Assets/ItemIcons/Consumables/ManaPotion.png"),
		tooltip = "One sip on this potion fills up 2 mana. \nKinda feels slimy in your throat and is very chilly.",
		equippable = true,
		script = "res://Items/Scripts/Consumables/manapotion.gd",
		nameColor = "light_blue",
	},
	"poisonbottle" : 
	{
		id = 3,
		itemRealname = "Potion of Poison",
		icon = preload("res://Assets/ItemIcons/Consumables/Poison.png"),
		tooltip = "Yummy yummy",
		equippable = true,
		script = "res://Items/Scripts/Consumables/poisonbottle.gd",
		nameColor = "light_green",
	},
}


############### ------- Getter Methods for accessing Itemlist ------- #########
func get_icon(item):
	return items[item].icon
	
func get_id(item):
	return items[item].id
	
func get_realName(item):
	return items[item].itemRealname
	
func get_tooltip(item):
	return items[item].tooltip


func can_equip(item):
	return items[item].equippable
	
func get_scriptpath(item):
	return items[item].script
	
func get_nameColor(item):
	return items[item].nameColor

#Utility Methods for working with the items
func collect_item(item):
	var loaded = false
	for slot in inventory_space.size() - 1 :
		if inventory_space[slot] == "":
			inventory_space[slot] = item
			loaded = true
			break
	if !loaded:
		DebugConsole.out("Couldnt Collect Item [" + item + "]")

func drop_item(item):
	pass
	
func equip_item(slot, item):
	if item != "":
		if slot == "right":
			if itemRight != item:
				itemRight = item
				scriptRight = load(get_scriptpath(item)).new()
				add_child(scriptRight)
				scriptRight.configure("right")
		else:
			if itemLeft != item:
				
				itemLeft = item
				scriptLeft = load(get_scriptpath(item)).new()
				add_child(scriptLeft)
				scriptLeft.configure("left")

func waste_item(sel):
	if sel == "left":
		inventory_space[18] = ""
		itemLeft = ""
	else:
		inventory_space[19] = ""
		itemRight = ""
		itemRight = ""
		
			
	
