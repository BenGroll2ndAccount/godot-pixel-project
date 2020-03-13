extends Node


var dialogues = {
	"1" : 	{
		##pages
		"1" : 	{
				"author" 	: "Kek",
				"color"		: "green",
				"text"		: "Jo Du bist n Kek",
				},
		"2" :	{
				"author"	: "Kek2",
				"color"		: "red",
				"text"		: "Jo du bist auch ein Kek",
			
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

func get_color(number, page):
	var dialogue = dialogues[number]
	var pages = dialogue[page]
	return pages["color"]
	
func get_pageCount(number):
	return dialogues[number].keys().size()
