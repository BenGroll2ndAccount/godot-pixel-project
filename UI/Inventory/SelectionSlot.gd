extends MarginContainer
var hovered
var item_name = ""

onready var INV = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()
onready var SelLeft = INV.get_node("InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotLeft")
onready var SelRight = INV.get_node("InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotRight")


func _ready():
	connect("mouse_entered", self, "hover")
	connect("mouse_exited", self, "dehover")

func _process(delta):
	if item_name != "":
		$ItemIcon.texture = Items.get_icon(item_name)
	else:
		$ItemIcon.texture = null
	if hovered:
		if Input.is_action_just_pressed("E"):
			if name != "SelectionSlotRight":
				swap()
		if Input.is_action_just_pressed("Q"):
			if name != "SelectionSlotLeft":
				swap()
	

func insert(item):
	item_name = item


func clear():
	item_name = ""


func hover():
	hovered = true
	if item_name != "":
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName").text = Items.get_realName(item_name)
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/Tooltip").text = Items.get_tooltip(item_name)
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName").set("custom_colors/font_color", INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName").colors[Items.get_nameColor(item_name)])
	else:
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName").text = ""
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/Tooltip").text = ""
	
func dehover():
	hovered = false
	
func swap():
	var Left = SelLeft.item_name
	var Right = SelRight.item_name
	SelLeft.insert(Right)
	SelRight.insert(Left)
	INV.update_selection("q", SelLeft.item_name)
	INV.update_selection("e", SelRight.item_name)
	if item_name != "":
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName").text = item_name
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/Tooltip").text = Items.get_tooltip(item_name)
	else:
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName").text = ""
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/Tooltip").text = ""
	
