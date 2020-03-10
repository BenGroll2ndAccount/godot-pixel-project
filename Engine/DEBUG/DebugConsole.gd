extends CanvasLayer

func _ready():
	$Debugoutput.lines_skipped = 1


func out(text):
	$Debugoutput.text = $Debugoutput.text + str("\n" + text)
	yield(get_tree().create_timer(5), "timeout")
	$Debugoutput.lines_skipped += 1
