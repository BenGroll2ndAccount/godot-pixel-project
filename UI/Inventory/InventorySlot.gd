extends MarginContainer

var item_name = ""
var hovered


onready var INV = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent()
onready var Carrier = INV.get_node("Carrier")
onready var SelLeft = INV.get_node("InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotLeft")
onready var SelRight = INV.get_node("InventoryContainer/VSplitContainer/HSplitContainer/SelectionContainer/Slots/SelectionContainer2/SelectionSlotRight")

func _process(delta):
	if item_name != "":
		$CenterContainer/Sprite.texture = Items.get_icon(item_name)
	else:
		$CenterContainer/Sprite.texture = null
	if Input.is_action_just_pressed("Left_Mouse"):	
		if hovered:
			Carrier.toggle(self)
	if Input.is_action_just_pressed("Q"):
		swap_q()
	if Input.is_action_just_pressed("E"):
		swap_e()
		
		
	
func _ready():
	$Detector.connect("mouse_entered", self, "hover")
	$Detector.connect("mouse_exited", self, "dehover")
	$ColorRect.color = Color(0, 0, 0, 0.3)

func register():
	INV.register_slot(self)
	
func hover():
	if item_name != "":
		var InvName = INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName")
		InvName.text = Items.get_realName(item_name)
		InvName.set("custom_colors/font_color", InvName.colors[Items.get_nameColor(item_name)])
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/Tooltip").text = Items.get_tooltip(item_name)
	else:
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/ItemName").text = ""
		INV.get_node("InventoryContainer/VSplitContainer/TooltipContainer/TooltipBackground/Tooltip").text = ""
		
	hovered = true
	$ColorRect.color = Color(0, 0, 0, 0.2)
	
	
func dehover():
	hovered = false
	$ColorRect.color = Color(0, 0, 0, 0.3)

func insert(item):
	item_name = item
	INV.update_slotspace(self, item_name)
	
func clear():
	item_name = ""
	
func swap_q():
	if hovered:
		if ! item_name == "":
			if Items.can_equip(item_name):
				var own = item_name
				var other = SelLeft.item_name
				SelLeft.item_name = own
				item_name = other
				INV.update_slotspace(self, "")
				INV.update_selection("q", SelLeft.item_name)
			
			
		

func swap_e():
	if hovered:
		if ! item_name == "":
			if Items.can_equip(item_name):
				var own = item_name
				var other = SelRight.item_name
				SelRight.item_name = own
				item_name = other
				INV.update_slotspace(self, "")
				INV.update_selection("e", SelRight.item_name)
			
