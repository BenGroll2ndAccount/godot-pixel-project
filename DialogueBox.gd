extends Node2D
var Conv
var pages
var page_current = 0

func start(id):
	$RichTextLabel.visible_characters = 0
	SceneSwitcher.dialogue_open = true
	Conv = id
	get_tree().paused = true
	pages = Conversations.get_pageCount(id)
	$AnimationPlayer.play("go_up")
	yield($AnimationPlayer, "animation_finished")
	$CharName.text = Conversations.get_author(id, "1")
	$RichTextLabel.text = Conversations.get_text(id, "1")
	$CharName.set("custom_colors/font_color", PredefinedColors.colors[Conversations.get_color(id, "1")])
	scribble($RichTextLabel.text.length())
	page_current = 1
	
	
func _process(delta):
	if Input.is_action_just_pressed("Enter"):
		if page_current < pages:
			load_new_page()
		else:
			$AnimationPlayer.play_backwards("go_up")
			yield($AnimationPlayer, "animation_finished")
			get_tree().paused = false
			SceneSwitcher.dialogue_open = false
			queue_free()
			
func load_new_page():
	$RichTextLabel.visible_characters = 0
	page_current += 1
	$CharName.text = Conversations.get_author(str(Conv), str(page_current))
	$RichTextLabel.text = Conversations.get_text(str(Conv), str(page_current))
	$CharName.set("custom_colors/font_color", PredefinedColors.colors[Conversations.get_color(str(Conv), str(page_current))])
	scribble($RichTextLabel.text.length())

func scribble(length):
	for x in range(length):
		$RichTextLabel.visible_characters +=1
		yield(get_tree(), "idle_frame")
