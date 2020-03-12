extends Node


var dialogues = {
	"1" : 	{
		##pages
		"1" : 	{
				"author" 	: "Kek",
				"text"		: "Jo Du bist n Kek",
				},
		
			},
	
	
	
}



####### Getset Methods #######
func get_author(number, page):
	var dialogue = dialogues[number]
	var pages =  dialogue[page]
	return pages["author"]
	
func get_text(number, page):
	var dialogue = dialogues[number]
	var pages =  dialogue[page]
	return pages["text"]
