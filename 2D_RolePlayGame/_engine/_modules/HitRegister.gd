tool
extends Node
export (String) var type 

func _get_configuration_warning():
	if not get_parent().has_node("KnockbackController"):
		if get_parent().has_node("HurtBox"):
			return "No KnockbackController to use."
		else:
			return "No HurtBox assigned, no KnockBackController to use."
	else:
		if not get_parent().has_node("HurtBox"):
			return "No HurtBox assigned."
		else:
			return ""
	
	

	
	
func _ready():
	if get_parent().get_node("HurtBox") != null:
		get_parent().get_node("HurtBox").connect("area_entered", self, "_on_area_entered")
		
	
func _on_area_entered(area):
	if area.name == "HitBox":
		if area.get("type") != type: 
			if get_parent().get_node("KnockbackController"):
				get_parent().get_node("KnockbackController").knock(area.get("knockback"), area)
			self.get_parent().get_node("HealthController").damage(area.get_parent().get("damage"))