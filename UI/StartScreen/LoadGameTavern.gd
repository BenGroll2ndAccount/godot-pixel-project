extends Sprite


func _ready():
	$OverlayArea.connect("mouse_entered", self, "mouse_entered")
	$OverlayArea.connect("mouse_exited", self, "mouse_exited")
	
func mouse_entered():
	$AnimationPlayer.play("bubble")
	if $SignLight.energy != 0:
		$SignLight.energy += 0.3
		$SignLight2.energy += 0.3
	
func mouse_exited():
	$AnimationPlayer.stop()
	if $SignLight.energy != 0:
		$SignLight.energy -= 0.3
		$SignLight2.energy -= 0.3
